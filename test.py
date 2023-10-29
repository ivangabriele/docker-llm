import openai

openai.api_key = "None"
openai.api_base = "http://localhost:8000/v1"
completion = openai.Completion.create(model="./model", prompt="Mumbai is a")

print("Completion result:", completion)
