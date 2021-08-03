"""Python module with Simple Message Service functionality (supposedly)"""


class SMSMessage():
    """ A class whose object holds an SMS message
    and whose functions work on that message """

    def __init__(self, message_text, from_number):
        self.seen = False  # new messages are always marked unseen
        self.text = message_text
        self.cell_num = from_number

    def __str__(self):  # message object reflection
        print("Seen:", self.seen)
        print("Message:", self.text)
        print("From number:", self.cell_num)

    def mark_as_read(self):
        """Message object private function to mark itself read"""
        self.seen = True

    def show(self):  # show message
        """Prints the text of the message"""
        print(self.text)
        self.mark_as_read()

    def destroy(self):
        """SMS object deconstructor: NEEDS IMPROVEMENT"""
        self.seen = False
        self.text = ""
        self.cell_num = 0


class SMSMessageList():
    """A class which holds SMSMessage objects
    in a list and functions which act on this list"""
    def __init__(self):
        self.sms_store = []

    def __str__(self):
        print("sms_store", self.sms_store)

    def add(self, msg):
        """Add a message to the message list"""
        self.sms_store.append(msg)

    def get_unread_messages(self):
        """Retrieve unread messages from the message list"""
        for msg in self.sms_store:
            if msg.seen:
                pass
            else:
                msg.show()
                msg.mark_as_read()

    def receive(self):
        """Stub for future networking logic to receive messages"""

    def send(self):
        """Stub for future networking logic to send messages"""

    def destroy(self):
        """SMS Message List deconstructor"""
        self.sms_store = []


class App():
    """The abstraction for the application obect
    that will be instantiated with each application"""
    def __init__(self):
        """Class constructor"""
        self.sms_list = SMSMessageList()
        self.choice = ""

    def __str__(self):
        """Reflection function for the App object"""

    def main(self):
        """Entry point to application"""
        self.sms_list.add(SMSMessage("Hello", "0798653452"))
        self.sms_list.add(SMSMessage("WYD", "0845673864"))
        self.sms_list.add(SMSMessage("How are you?", "0631873298"))

        while self.choice != "quit":
            self.choice = input("Please choose?(read,send or quit)")
            if self.choice == "read":
                self.sms_list.get_unread_messages()
            elif self.choice == "send":
                msg = input("Please type your message")
                tel = input("Please enter the cellphone number")
                self.sms_list.add(SMSMessage(msg, tel))
                self.sms_list.send()
            elif self.choice == "quit":
                print("Goodbye")
                self.sms_list.destroy()
            else:
                print("Oops - incorrect input")


app = App()

app.main()
