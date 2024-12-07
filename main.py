import tkinter as tk
from tkinter import messagebox, ttk
from ttkbootstrap import Style
from data import quiz_data
import clips
import logging
import os

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

# Function to display the current question and choices
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
    selected_choice = []
    questionShow = ""
    for fact in env.facts():
        if fact.template.name == 'question':
            for elem in fact:
                question += elem.capitalize()
                questionShow += elem + ' '
    qs_label.config(text=questionShow)

    choices=[]
    for fact in env.facts():
        if fact.template.name=='answers':
            for elem in fact:
                choices.append(elem)

    for i in range(6):
        if i<len(choices):
            choice_btns[i].pack()
            choice_btns[i].config(text=choices[i], state="normal")
        else:
            choice_btns[i].pack_forget()

    next_btn.config(state="disabled")


# sprawdzać czy wiele odpowiedzi / czy liść, odznaczanie, pojawianie sie na koncu
def check_answer(choice):
    if choice_btns_number[choice]%2==0:
        choice_btns[choice].config(style='Clicked.TButton')
        selected_choice.append(choice_btns[choice].cget("text"))
    else:
        choice_btns[choice].config(style='Standard.TButton')
        selected_choice.remove(choice_btns[choice].cget("text"))
    choice_btns_number[choice]+=1
    if len(selected_choice)>0:
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
    env.assert_string('(token ask)')

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

# Create the question label
qs_label = ttk.Label(root, anchor="center", wraplength=500, padding=10)
qs_label.pack(pady=10)

#                                                                               Create the choice buttons
choice_btns = []
choice_btns_number = []
for i in range(6):
    choice_btns_number.append(0)
    button = ttk.Button(root, command=lambda i=i: check_answer(i), style='Standard.TButton')
    button.pack(pady=5)
    choice_btns.append(button)

#                                                                           Create the feedback label
feedback_label = ttk.Label(root, anchor="center", padding=10)
feedback_label.pack(pady=10)

#                                                                       Initialize the score
score = 0

#                                                                                   Create the score label
score_label = ttk.Label(
    root,
    text="Score: 0/{}".format(len(quiz_data)),
    anchor="center",
    padding=10
)
score_label.pack(pady=10)

# Create the next button
next_btn = ttk.Button(root, text="Next", command=next_question, state="disabled")
next_btn.pack(pady=10)

#                                                                           Initialize the current question index
current_question = 0

# Show the first question
show_question()

# Start the main event loop
root.mainloop()
