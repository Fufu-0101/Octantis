#pragma once

#ifdef OCT_PLATFORM_WINDOWS
extern Octantis::Application* Octantis::CreateApplication();

int main(int argc,char** argv)
{
	auto app = Octantis::CreateApplication();
	app->Run();
	delete app;
	return 0;
}
#endif