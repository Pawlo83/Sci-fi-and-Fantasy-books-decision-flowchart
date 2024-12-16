import tkinter as tk
from tkinter import messagebox

# Dane quizu: pytania, odpowiedzi i poprawne odpowiedzi
quiz_data = [
    {
        "question": "Jakie jest największe miasto w Polsce?",
        "options": ["Kraków", "Warszawa", "Gdańsk", "Poznań"],
        "answer": "Warszawa"
    },
    {
        "question": "Który z poniższych języków programowania jest najstarszy?",
        "options": ["Python", "C", "Java", "Fortran"],
        "answer": "Fortran"
    },
    {
        "question": "Który kontynent jest największy pod względem powierzchni?",
        "options": ["Afryka", "Azja", "Ameryka Południowa", "Europa"],
        "answer": "Azja"
    }
]

# Zmienne globalne
current_question_index = 0
score = 0


# Funkcja do obsługi kliknięcia "Dalej"
def next_question():
    global current_question_index, score

    # Sprawdzenie poprawności odpowiedzi
    if selected_option.get() == quiz_data[current_question_index]["answer"]:
        score += 1

    # Przejście do kolejnego pytania lub zakończenie quizu
    current_question_index += 1
    if current_question_index < len(quiz_data):
        load_question()
    else:
        show_result()

# Funkcja do załadowania pytania
def load_question():
    global current_question_index

    # Pobranie danych aktualnego pytania
    question_data = quiz_data[current_question_index]

    # Zaktualizowanie pytania
    label_question.config(text=question_data["question"])

    # Zaktualizowanie odpowiedzi
    for i, option in enumerate(question_data["options"]):
        radio_buttons[i].config(text=option, value=option)

    # Zresetowanie zaznaczonej odpowiedzi
    selected_option.set(None)

# Funkcja do wyświetlenia wyniku
def show_result():
    global score
    result_message = f"Twój wynik: {score}/{len(quiz_data)}"
    messagebox.showinfo("Wynik", result_message)
    root.destroy()  # Zamknięcie aplikacji

# Tworzenie głównego okna aplikacji
root = tk.Tk()
root.title("Quiz")
root.geometry("500x300")
selected_option = tk.StringVar()  # Przechowuje aktualnie zaznaczoną odpowiedź

# Etykieta pytania
label_question = tk.Label(root, text="", font=("Arial", 14), wraplength=480, justify="center")
label_question.pack(pady=20)

# Przyciski opcji
radio_buttons = []
for i in range(4):  # 4 opcje do wyboru
    radio_btn = tk.Radiobutton(root, text="", variable=selected_option, value="", font=("Arial", 12), wraplength=480)
    radio_btn.pack(anchor="w", pady=5)
    radio_buttons.append(radio_btn)

# Przycisk "Dalej"
button_next = tk.Button(root, text="Dalej", command=next_question, font=("Arial", 12))
button_next.pack(pady=20)

# Ładowanie pierwszego pytania
load_question()

# Uruchomienie pętli głównej aplikacji
root.mainloop()