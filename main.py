import tkinter as tk
from tkinter import messagebox, ttk, PhotoImage
from ttkbootstrap import Style
from data import quiz_data
import clips
import logging
import os
from PIL import Image

# Weryfikacja czy jest dalsze poszukiwanie w momencie gdy jest już książka (sure do modern or classic), ilość odpowiedzi
#
#
#

logging.basicConfig(level=logging.DEBUG, force=True, format='%(message)s')
env = clips.Environment()
router = clips.LoggingRouter()
env.add_router(router)
env.load('facts.clp')
env.load('rules.clp')
env.reset()
print("Facts:\n")
for fact in env.facts():
    print(fact)
print("Rules:\n")
for rule in env.rules():
    print(rule)
env.run()

selected_choice = []
question = ''
numberOfAnswers=0
recommendations=[]
loopi=0

def show_question():
    global question, numberOfAnswers, img, recommendations, loopi
    question = ''
    selected_choice.clear()
    questionShow = ''
    y=0

    if loopi==0:
        for fact in env.facts():
            if fact.template.name=='recommendation':
                book = ['', '', '']
                for i in range(len(fact)):
                    y+=1
                    book[i] = fact[i]
                if book[2]!='':
                    recommendations.append(book)
    if y>1 or loopi>0:
        questionShow=recommendations[loopi][0]+' - '+recommendations[loopi][1]
        for word in recommendations[loopi][0].split():
            question += word.capitalize()
        question += '?'
        selected_choice.append('No:')
        img = PhotoImage(file=recommendations[loopi][2])
        imggrid = ttk.Label(root, image=img)
        imggrid.grid(row=9, column=0, columnspan=5, pady=5)
        qs_label.config(text=questionShow)
        noa_label.grid_forget()
        iff=0
        for fact in env.facts():
            if fact.template.name == 'token' and fact[0]=='next':
                iff=1
        if len(recommendations)==1 and iff==0:
            next_btn.config(state="disabled")
            next_btn.config(text="END")
    else:
        for fact in env.facts():
            if fact.template.name == 'question':
                for i in range(len(fact)):
                    if fact[i]==fact[-1]:
                        numberOfAnswers=fact[i]
                    else:
                        question += fact[i].capitalize()
                        questionShow += fact[i] + ' '

        qs_label.config(text=questionShow)
        noa_label.grid(row=1, column=1, columnspan=3, pady=20)
        noa_label.config(text='(NUMBER OF POSSIBLE ANSWERS: ' + str(numberOfAnswers) + ')')
        next_btn.config(state="disabled")

    choices=[]
    for fact in env.facts():
        if fact.template.name=='answers':
            for elem in fact:
                choices.append(elem)
    i=0
    j=0
    while i < len(choice_btns):
        choice_btns_number[i] = 0
        if j < len(choices):
            choice_btns[i].config(style='Standard.TButton')
            choice_btns[i].grid(row=i + 2, column=1, columnspan=3, pady=5)
            if choices[j][-1] == ":":
                choice_btns[i].config(text=choices[j] + ' ' + choices[j + 1], state="normal")
                j+=1
            else:
                choice_btns[i].config(text=choices[j], state="normal")
        else:
            choice_btns[i].grid_forget()
            #choice_btns[i].config(style='Invis.TButton')
        i+=1
        j+=1


# sprawdzać czy wiele odpowiedzi / czy liść, pojawianie sie na koncu
def check_answer(choice):
    if choice_btns_number[choice]%2==0:
        choice_btns[choice].config(style='Clicked.TButton')
        selected_choice.append(choice_btns[choice].cget("text"))
    else:
        choice_btns[choice].config(style='Standard.TButton')
        selected_choice.remove(choice_btns[choice].cget("text"))
    choice_btns_number[choice]+=1
    numberOfSelectedButtons = 0
    for button in choice_btns_number:
        numberOfSelectedButtons += button % 2

    print(numberOfSelectedButtons)

    iff=0
    for elem in selected_choice:
        if elem.startswith("No:"):
            iff=1
    if numberOfSelectedButtons==0 or numberOfSelectedButtons>numberOfAnswers or (iff==1 and numberOfSelectedButtons>1):
        next_btn.config(state="disabled")
    else:
        next_btn.config(state="normal")


# Function to move to the next question
def next_question():
    global loopi

    if len(recommendations)==1:
        #result = env.eval('(find-fact ( recommendation "'+recommendations[0][0]+'" "'+recommendations[0][1]+'" "'+recommendations[0][2]+'") TRUE)')
        for fact in env.facts():
            if fact.template.name == 'recommendation':
                fact.retract()
        recommendations.pop()
    elif len(recommendations)>1:
        loopi+=1
        loopi=loopi%len(recommendations)

    assertt='('+question+' '
    for elem in selected_choice:
        assertt+=elem+' '
    assertt+=')'
    env.assert_string(assertt)

    assertt = '(previousQuestion '+question+')'
    env.assert_string(assertt)

    env.assert_string('(token ask)')
    print("Facts:\n")
    for fact in env.facts():
        print(fact)
    env.run()
    print("Facts:\n")
    for fact in env.facts():
        print(fact)

    print("Rules:\n")
    for rule in env.rules():
        print(rule)
    show_question()

        # If all questions have been answered, display the final score and end the quiz
        #messagebox.showinfo("Quiz Completed",
        #                   "Quiz Completed! Final score: {}/{}".format(score, len(quiz_data)))
        #root.destroy()


# Create the main window
root = tk.Tk()
root.title("Sci-fi and Fantasy books decision flowchart")
root.geometry("1200x600")
root.grid_columnconfigure(0, weight=1, uniform="fred")
root.grid_columnconfigure(1, weight=1, uniform="fred")
root.grid_columnconfigure(2, weight=1, uniform="fred")
root.grid_columnconfigure(3, weight=1, uniform="fred")
root.grid_columnconfigure(4, weight=1, uniform="fred")

style = Style(theme="flatly")
style.map('TButton', background=[('active','red')])

# Configure the font size for the question and choice buttons
style.configure("TLabel", font=("Consolas", 20, 'bold'), background="light grey")

style.configure(
    'Standard.TButton',
    foreground='white',
    background='teal',
    font=('Consolas', 12)
)

style.configure(
    'Clicked.TButton',
    foreground='white',
    background='dark blue',
    font=('Consolas', 12)
)

style.configure(
    'Next.TButton',
    foreground='white',
    background='dark blue',
    font=('Consolas', 16, 'bold')
)

style.configure(
    'Sublabel.TLabel',
    font=('Consolas', 12)
)

# Create the question label
qs_label = ttk.Label(root, anchor="center", wraplength=500, padding=10, justify="center")
qs_label.grid(row = 0, column = 0, columnspan = 5, pady = 0)
noa_label = ttk.Label(root, anchor="center", wraplength=500, padding=10, style='Sublabel.TLabel', justify="center")

# Create the choice buttons
choice_btns = []
choice_btns_number = []

for i in range(7):
    choice_btns_number.append(0)
    button = ttk.Button(root, command=lambda i=i: check_answer(i), style='Standard.TButton')
    button.grid(row=i + 2, column=1, columnspan=4, pady=5)
    choice_btns.append(button)

# Create the next button
next_btn = ttk.Button(root, text="Next", command=next_question, state="disabled", style='Next.TButton')
next_btn.place(relx = 1, rely=1, x =-30, y = -30, anchor = 'se')

# Show the first question
show_question()

# Start the main event loop
root.mainloop()