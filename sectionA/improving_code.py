#!/usr/bin/env python

class SMSMessage():
    """ A class whose object holds an SMS message
    and whose functions work on that message """
    
    def __init__(self,has_been_read,message_text,from_number):
        self.seen = has_been_read
        self.text = message_text
        self.cell_num = from_number

    def mark_as_read(self):
        self.seen = True

    
class SMSMessageList():
    def __init__(self):
        self.SMS_store = []
        self.user_choice = "" # this is here because it was in the copied from the students code

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

 
class App():
    def __init__(self):
        pass

    def __str__():
        pass
    
    def main():
        sms_list = SMSMessageList()
        sms_list.add_sms(SMSMessage(False,"Hello","0798653452"))

app = App()
app.main()


    
# if user_choice == read:
#     self.has_been_read = True

# no_1 = SMSMessage(False, "Hello", "0798653452")
# no_2 = SMSMessage(False, "WYD", "0845673864")
# no_3 = SMSMessage(False, "How are you?", "0631873298")


# while user_choice != "quit":
#     user_choice = raw_input("What would you like to do -
# read/send/quit?")
#     if user_choice == "read":

#     elif user_choice == "send": #
#         #Place your logic here
#     elif user_choice == "quit":
#         print("Goodbye")
#     else:
#         print("Oops - incorrect input")
