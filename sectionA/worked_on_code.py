#!/usr/bin/env python

class SMSMessage():
    """ A class whose object holds an SMS message
    and whose functions work on that message """
    
    def __init__(self,message_text,from_number):
        self.seen = False # new messages are always marked unseen
        self.text = message_text
        self.cell_num = from_number

    def __str__(self): #message object reflection
        print("Seen:", self.seen)
        print("Message:", self.text)
        print("From number:",self.cell_num)

    def mark_as_read(self):
        self.seen = True

    def show(self): #show message
        print(self.text)
        self.mark_as_read()

    def destroy(self):
        self.seen = null
        self.text = null
        self.cell_num = null
                
        
class SMSMessageList():
    """ A class which holds the SMSMessage objects 
    in a list and functions which act on this list """
    def __init__(self):
        self.SMS_store = []

    def __str__(self):
        print("SMS_store", self.SMS_store)
        
    def add(self,msg):
        """Add a message to the message list"""
        self.SMS_store.append(msg)
    
    def get_unread_messages(self):
        for msg in self.SMS_store:
            if msg.seen:
                pass
            else:
                msg.show()
                msg.mark_as_read()
                
    def receive():
        pass # do some network stuff here

    def send():
        pass # do some other network stuff here

    def destroy(self):
        self.SMS_store = []

 
class App():
    def __init__(self):
        pass

    def __str__():
        pass
    
    def main():
        sms_list = SMSMessageList()
        sms_list.add(SMSMessage("Hello","0798653452"))
        sms_list.add(SMSMessage("WYD", "0845673864"))
        sms_list.add(SMSMessage("How are you?", "0631873298"))

        sms_list.get_unread_messages()
        sms_list.destroy()
        
    def read_messages(self):
        self.sms_list.get_unread_messages()
        
        
app = App
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
