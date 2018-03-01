// Dependency Inversion Principle Violation
component bindingName="Mailer"
{

}

component bindingName="SendWelcomeMessage"
{
    property name="mailer";

    public any function init(Mailer mailer)
    {
        mailer = mailer;
    }
}

// Refactored
interface bindingName="Mailer"
{
    public string function send();
}

component bindingName="SmtpMailer" implements="Mailer"
{
    public string function send()
    {

    }
}

component bindingName="SendGridMailer" implements="Mailer"
{
    public string function send()
    {

    }
}

component bindingName="SendWelcomeMessage"
{
    property name="mailer";

    public any function init(Mailer mailer)
    {
        mailer = mailer;
    }
}
