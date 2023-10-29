import openai

openai.api_key = "None"
openai.api_base = "http://localhost:8000/v1"
completion = openai.Completion.create(
    model="./model",
    prompt="Paris is a"
)

print("Completion result:", completion)
