import fastchat
from fastchat.conversation import Conversation, SeparatorStyle
from fastchat.model.model_adapter import get_conversation_template

print(fastchat.__version__)
print(Conversation)
print(SeparatorStyle)
print(get_conversation_template)
