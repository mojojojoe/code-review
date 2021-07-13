Option 1: Python
Student Question
Hi there,
I'm having a bit of an issue with figuring out how to exactly implement the class
methods so that I may call them outside of the class when trying to create a new
SMS object.
Thanks,
Student

# An SMS Simulation class SMSMessage(object):
hasBeenRead = False messageText = text fromNumber = number
def __init__(self,hasBeenRead,messageText,fromNumber):
self.hasBeenRead = False self.messageText = text
self.fromNumber = number
def MarkASRead(self):
if userChoice == read:
self.hasBeenRead = True
def add_sms():
def get_count():
def get_message():
def get_unread_messages():
def remove():
no_1 = SMSMessage(False, "Hello", "0798653452")
no_2 = SMSMessage(False, "WYD", "0845673864")
no_3 = SMSMessage(False, "How are you?", "0631873298")
SMSStore = [] userChoice = ""
while userChoice != "quit":
userChoice = raw_input("What would you like to do -
read/send/quit?")
if userChoice == "read":
# Place your logic here elif userChoice == "send": #
Place your logic here elif userChoice == "quit":
print("Goodbye")
else:
print("Oops - incorrect input")


*REVIEW*

- variable assignments on the same line (see lines 1 & 16) (first commit)
- class needs to be defined - did this with basic constructor (second commit)
- added initial commentary/documenation on class def. I noticed that there is an inconsistency of style in variable nameing between cameltoe style and underscore style. Decided to use the underscore style throughout, except for class names.
- noticed that the while control structure and contents needed to be properly formatted
- reviewed function stubs. stubs lacked "pass" method. Placed them in the SMSMessage class but on assessment, it feels like there should be another class called SMSMessageList. Leave that for next step though.
- just noticed that class constructor has variable definitions in wrong direction. Values fed into the constructor should be used to populate the class fields, not the other way around...corrected this.
- added the SMSMessageList class to hold an different set of functions for use with the SMS storage list. This would then house the get_message, get_unread_messages, get_count and add_sms functions
- created the SMSMessageList class constructor and placed the SMS_store and user_choice variables inside this.
- realise that the classes will need to be instantiated and that this will help me finish off the SMS classes as it will give me a better conceptual understanding of what needs to be done. So, starting work on instantiating SMSMessageList class. 
- in instantiating SMSMessageList, an App class was defined as the object to contain the app. In getting the code to run the first 3 lines had to be cleaned up, as they are unnecessary. Also, a shebang line needed to be added to make the script runnable on its own.

