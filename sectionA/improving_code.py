hasBeenRead = False
messageText = text
fromNumber = number

class SMSMessage():
    """ A class whose object holds an SMS message"""
    
    def __init__(self,has_been_read,message_text,from_number):
        self.has_been_read = False self.message_text = text
        self.from_number = number
        def mark_as_read(self):
            
if user_choice == read:
self.has_been_read = True
def add_sms():
def get_count():
def get_message():
def get_unread_messages():
def remove():
no_1 = SMSMessage(False, "Hello", "0798653452")
no_2 = SMSMessage(False, "WYD", "0845673864")
no_3 = SMSMessage(False, "How are you?", "0631873298")

SMS_store = []
user_choice = ""

while userChoice != "quit":
user_choice = raw_input("What would you like to do -
read/send/quit?")
if user_choice == "read":
# Place your logic here elif user_choice == "send": #
Place your logic here elif user_choice == "quit":
print("Goodbye")
else:
print("Oops - incorrect input")
