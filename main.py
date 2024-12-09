import tkinter as tk
from tkinter import messagebox, ttk
from ttkbootstrap import Style
from data import quiz_data
import clips
import logging
import os

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

def show_question():
    """
    	for fact in env.facts():
            if fact.template.name=='prefered':
		for elem in fact:
                    y++
        if y>1
	    show_book()
	else
    """
    global question
    global numberOfAnswers
    question = ''
    selected_choice.clear()
    questionShow = ''

    for fact in env.facts():
        if fact.template.name == 'question':
            for i in range(len(fact)):
                if fact[i]==fact[-1]:
                    numberOfAnswers=fact[i]
                else:
                    question += fact[i].capitalize()
                    questionShow += fact[i] + ' '
    #                                                                                           podpis o ilości odpowiedzi mniejszy i pod ql
    qs_label.config(text=questionShow+' (NUMBER OF POSSIBLE ANSWERS: '+str(numberOfAnswers)+')')

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
            choice_btns[i].pack()
            if choices[j][-1] == ":":
                choice_btns[i].config(text=choices[j] + ' ' + choices[j + 1], state="normal")
                j+=1
            else:
                choice_btns[i].config(text=choices[j], state="normal")
        else:
            choice_btns[i].pack_forget()
            #choice_btns[i].config(style='Invis.TButton')
        i+=1
        j+=1

    next_btn.config(state="disabled")


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
    if numberOfSelectedButtons>0 and numberOfSelectedButtons<=numberOfAnswers:
        next_btn.config(state="normal")
    else:
        next_btn.config(state="disabled")


# Function to move to the next question
def next_question():
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
root.geometry("600x600")
style = Style(theme="flatly")
style.map('TButton', background=[('active','red')])

# Configure the font size for the question and choice buttons
style.configure("TLabel", font=("Helvetica", 20))
style.configure("TButton", font=("Helvetica", 16))

style.configure('Standard.TButton',
                foreground='white',
                background='blue',
                font=('Helvetica', 12, 'bold'))

# Style for Button 2
style.configure('Clicked.TButton',
                foreground='black',
                background='green',
                font=('Arial', 10, 'italic'))

style.configure('Invis.TButton',
                background=[("disabled", root.cget('bg'))],
                foreground=[("disabled", root.cget('bg'))],
                border=0
                )

# Create the question label
qs_label = ttk.Label(root, anchor="center", wraplength=500, padding=10)
qs_label.pack(pady=10)

#                                                                               Create the choice buttons
choice_btns = []
choice_btns_number = []
for i in range(7):
    choice_btns_number.append(0)
    button = ttk.Button(root, command=lambda i=i: check_answer(i), style='Standard.TButton')
    button.pack(pady=10)
    choice_btns.append(button)

# Create the next button
next_btn = ttk.Button(root, text="Next", command=next_question, state="disabled")
next_btn.pack(pady=20, side='bottom')

# Show the first question
show_question()

# Start the main event loop
root.mainloop()