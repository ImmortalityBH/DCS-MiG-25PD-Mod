// dllmain.cpp : Defines the entry point for the DLL application.
#include "stdafx.h"
#include <Windows.h>
#include <wincrypt.h>
#include <iostream>
#include <wincon.h>
#include <string>
#include <winsock.h>
#include <stdlib.h>

#define SAFE 0
#define UNSAFE 1
#define NOT_FOUND 2 

#define BUFFER_SIZE 1024
#define HASH_LEN 20

BOOL APIENTRY DllMain( HMODULE hModule,
                       DWORD  ul_reason_for_call,
                       LPVOID lpReserved
					 )
{
	switch (ul_reason_for_call)
	{
	case DLL_PROCESS_ATTACH:
#if _DEBUG
        if (AllocConsole())
        {
            freopen("CONOUT$", "w", stdout);
            SetConsoleTitle(L"DCS MiG-25P Debug Console");
            SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 
                FOREGROUND_GREEN | FOREGROUND_BLUE | FOREGROUND_RED);
        }
        else 
        {
            MessageBox(nullptr, L"Failed to create console", L"Error", MB_ICONERROR);
        } //allows for printf usage
#endif
        
	case DLL_THREAD_ATTACH:
	case DLL_THREAD_DETACH:
	case DLL_PROCESS_DETACH:
		break;
	}
	return TRUE;
}

// function credit JNelson
/*int getHash(LPCWSTR filename, BYTE* hashBuffer)
{
    DWORD status = 0;
    HANDLE file = NULL;

    file = CreateFile(filename, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, FILE_FLAG_SEQUENTIAL_SCAN, NULL);

    if (file == INVALID_HANDLE_VALUE)
    {
        status = GetLastError();
        LOG("Error opening file %ws\nError: %d\n", filename, status);
        return NOT_FOUND;
    }
    HCRYPTPROV provider = 0;
    HCRYPTHASH hash = 0;

    if (!CryptAcquireContext(&provider, NULL, NULL,
        PROV_RSA_FULL, CRYPT_VERIFYCONTEXT))
    {
        status = GetLastError();
        LOG("CryptAcquireContext failed: %d\n", status);
        CloseHandle(file);
        return UNSAFE;
    }

    if (!CryptCreateHash(provider, CALG_SHA1, 0, 0, &hash))
    {
        status = GetLastError();
        LOG("CryptCreateHash failed: %d\n", status);
        CloseHandle(file);
        CryptReleaseContext(provider, 0);
        return UNSAFE;
    }

    BOOL result = FALSE;


    DWORD bytesRead = 0;
    BYTE* buffer = (BYTE*)malloc(BUFFER_SIZE);

    while (result = ReadFile(file, buffer, BUFFER_SIZE, &bytesRead, NULL))
    {
        if (bytesRead == 0)
            break;
        if (!CryptHashData(hash, buffer, bytesRead, 0))
        {
            status = GetLastError();
            LOG("CryptHashData failed: %d\n", status);
            CryptReleaseContext(provider, 0);
            CryptDestroyHash(hash);
            CloseHandle(file);
            free(buffer);
            return UNSAFE;
        }
    }

    if (!result)
    {
        status = GetLastError();
        LOG("ReadFile failed: %d\n", status);
        CryptReleaseContext(provider, 0);
        CryptDestroyHash(hash);
        CloseHandle(file);
        free(buffer);
        return UNSAFE;
    }

    DWORD hashBytes = HASH_LEN;
    int safe = SAFE;

    if (!CryptGetHashParam(hash, HP_HASHVAL, hashBuffer, &hashBytes, 0))
    {
        status = GetLastError();
        LOG("CryptGetHashParam failed: %d\n", status);
        safe = UNSAFE;
    }

    CryptReleaseContext(provider, 0);
    CryptDestroyHash(hash);
    CloseHandle(file);
    free(buffer);

    return SAFE;
}*/
/*
How to print debug info from EFM.
First - you need to define console window in your project
Go to dllmain.cpp and edit it as:

// dllmain.cpp : Defines the entry point for the DLL application.
#include "stdafx.h"
#include <windows.h>
#include <iostream>
#include <WinCon.h>
#include <string>
#include <winsock.h>

FILE* flog = 0;
//SOCKET s = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);

BOOL APIENTRY DllMain( HMODULE hModule,
                       DWORD  ul_reason_for_call,
                       LPVOID lpReserved
                     )
{


    switch (ul_reason_for_call)
    {
        case DLL_PROCESS_ATTACH:
        //flog = fopen("E:\test.log", "w");
        // COnsole

if (AllocConsole())
{
    freopen("CONOUT$", "w", stdout);
    SetConsoleTitle((L"DCS Mig29OVT debug console"));
    SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), FOREGROUND_GREEN | FOREGROUND_BLUE | FOREGROUND_RED);
}
else
{
    //MessageBox(0,L"FAIL_console",L"Error",0);
}

break;

    case DLL_THREAD_ATTACH:
    case DLL_THREAD_DETACH:
        break;
    case DLL_PROCESS_DETACH:
        //if (flog) fclose(flog);

        break;
    }
    return TRUE;
}
(edited)
[4:11 AM]
This will create console window popup when DCS runs(edited)

1
[4:12 AM]
then just use
printf("pitch =%f roll = %f\n", pitch, roll);
in any c / h file
*/