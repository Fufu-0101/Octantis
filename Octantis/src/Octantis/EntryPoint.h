#pragma once

#ifdef OCT_PLATFORM_WINDOWS
extern Octantis::Application* Octantis::CreateApplication();

int main(int argc,char** argv)
{

	Octantis::Log::Init();
	OCT_CORE_TRACE("trace");
	OCT_CORE_INFO("info");
	OCT_CORE_WARN("warn");
	OCT_CORE_ERROR("error");
	OCT_CLIENT_TRACE("trace");
	OCT_CLIENT_INFO("info");
	OCT_CLIENT_WARN("warn");
	OCT_CLIENT_ERROR("error");
	
	auto app = Octantis::CreateApplication();
	app->Run();
	delete app;
	return 0;
}
#endif