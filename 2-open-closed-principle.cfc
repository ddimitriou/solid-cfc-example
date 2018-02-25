// Open Closed Principle Violation
component bindingName="Programmer"
{
    public string function code()
    {
        return 'coding';
    }
}

component bindingName="Tester"
{
    public string function test()
    {
        return 'testing';
    }
}

component bindingName="ProjectManagement"
{
    public string function process(member)
    {
        if (isInstanceOf(member, 'Programmer')) {
            member.code();
        } elseif (isInstanceOf(member, 'Tester')) {
            member.test();
        };

        throw(type='Invalid input member');
    }
}

// Refactored
interface bindingName="Workable"
{
    public function work();
}

component bindingName="Programmer" implements="Workable"
{
    public string function work()
    {
        return 'coding';
    }
}

component bindingName="Tester" implements="Workable"
{
    public string function work()
    {
        return 'testing';
    }
}

component bindingName="ProjectManagement"
{
    public string function process(Workable member)
    {
        return member.work();
    }
}
