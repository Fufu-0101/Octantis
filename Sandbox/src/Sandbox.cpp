#include <Octantis.h>




class Sandbox :public Octantis::Application
{
public :
	Sandbox()
	{

	}
	~Sandbox()
	{

	}
};

Octantis::Application* Octantis::CreateApplication()
{
	return new Sandbox();
}