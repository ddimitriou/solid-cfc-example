// Interface Segregation Principle Violation
interface bindingName="Workable"
{
    public function canCode();
    public function code();
    public function test();
}

component bindingName="Programmer" implements="Workable"
{
    public boolean function canCode()
    {
        return true;
    }

    public string function code()
    {
        return 'coding';
    }

    public string function test()
    {
        return 'testing in localhost';
    }
}

component bindingName="Tester" implements="Workable"
{
    public boolean function canCode()
    {
        return false;
    }

    public string function code()
    {
         throw(type='Opps! I can not code');
    }

    public string function test()
    {
        return 'testing in test server';
    }
}

component bindingName="ProjectManagement"
{
    public void function processCode(Workable member)
    {
        if (member.canCode()) {
            member.code();
        }
    }
}

// Refactored
interface bindingName="Codeable"
{
    public string function code();
}

interface bindingName="Testable"
{
    public string function test();
}

component bindingName="Programmer" implements="Codeable,Testable"
{
    public string function code()
    {
        return 'coding';
    }

    public string function test()
    {
        return 'testing in localhost';
    }
}

component bindingName="Tester" implements="Testable"
{
    public string function test()
    {
        return 'testing in test server';
    }
}

component bindingName="ProjectManagement"
{
    public void function processCode(Codeable member)
    {
        member.code();
    }
}
