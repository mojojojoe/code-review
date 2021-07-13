hasBeenRead = False
messageText = text
fromNumber = number

class SMSMessage():
    """ A class whose object holds an SMS message"""
    
    def __init__(self,has_been_read,message_text,from_number):
        self.has_been_read = False
        self.text = message_text
        self.cell_num = from_number

    def mark_as_read(self):
        pass

    def add_sms():
        pass
    
    def get_count():
        pass
    
    def get_message():
        pass
    
    def get_unread_messages():
        pass

    def remove():
        pass

    
if user_choice == read:
self.has_been_read = True

no_1 = SMSMessage(False, "Hello", "0798653452")
no_2 = SMSMessage(False, "WYD", "0845673864")
no_3 = SMSMessage(False, "How are you?", "0631873298")

SMS_store = []
user_choice = ""

while userChoice != "quit":
    user_choice = raw_input("What would you like to do -
read/send/quit?")
    if user_choice == "read":
# Place your logic here
    elif user_choice == "send": #
        #Place your logic here
    elif user_choice == "quit":
        print("Goodbye")
    else:
        print("Oops - incorrect input")
