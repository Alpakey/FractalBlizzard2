unit CPUCounter_Hss;

          ////////////////////////////////////////////////////////
          //                                                    //
          //      CPU���ڼ��������  ���ߣ���˼��   2002�ꡣ    //
          //                                                    //
          //                HouSisong@263.net                   //
          //                                                    //
          ////////////////////////////////////////////////////////

interface

uses SysUtils;

  {  CPU���ڼ�������� (��֧��486������CPU) :
     ��ȡ��ǰCPU���ڼ��������߻�ȡ��ǰʱ�����
     �������ε��õĲ�ֵ�Ϳ���֪������ε�ִ��ʱ�䣬
     �����п��ܴﵽCPUָ������                     }
  function  CPUCycleCounter():int64 register;                   {��ȡ��ǰCPU���ڼ���(CPU������)}
  {$IFDEF MSWINDOWS}
  function  CPUTimeCounter():Extended;                          {��ȡ��ǰʱ�����(us),����CPU�ڲ�ָ�����}
  function  CPUTimeCounterQPC():Extended;                       {��ȡ��ǰʱ�����(us),���ø����ܼ��������}
  function  GetCPUFrequency():int64;overload;                   {���CPU����Ƶ,׼ȷ����}
  function  GetCPUFrequency(const dTime:integer):int64;overload;{���CPU����Ƶ,׼ȷ����dTime������,dTime��λΪms}
  {$ENDIF}
  Procedure StopIf(const bValue:Boolean=True);                  {�����ϵ�,����ʱ������ΪTureʱ��ͣ���򣬱��磺StopIf(i>=100);}

  //============================================================================
{$IFDEF MSWINDOWS}
  function  CPUCallInitialize():Boolean;                        {��ʼ��,�ɹ�����True��ʧ�ܷ���False}


  //============================================================================

  {�ⲿAPI����}
  function QueryPerformanceCounter(var lpPerformanceCount: int64): LongBool; stdcall;
  {$EXTERNALSYM QueryPerformanceCounter}
  function QueryPerformanceFrequency(var lpFrequency: int64): LongBool; stdcall;
  {$EXTERNALSYM QueryPerformanceFrequency}
{$ENDIF}

  //============================================================================

implementation

  var CPUCycle0     :int64=0;    {CPU���ڼ���}
      QPCounter0    :int64=0;    {�����ܼ���������}
      QPCFrequency  :int64=0;    {�����ܼ�����Ƶ��}
      CPUFrequency  :int64=0;    {CPUƵ��}

Procedure StopIf(const bValue:Boolean=True);{����ʱ������ΪTureʱ��ͣ���򣬱��磺DebugStop(i>=100);}
begin
  //{$IFDEF DEBUG}
    if bValue then
    begin
        asm
            int 3
        end;
    end;
  //{$ENDIF}
end;  { ѹF8��F7�������ϵ㴦 }

function CPUCycleCounter():int64 register;assembler;{��ȡ��ǰCPU���ڼ���(CPU������)}
asm
    RDTSC         {eax,edx}
end;

{$IFDEF MSWINDOWS}
function CPUCallInitialize():Boolean;{��ʼ��,�ɹ�����True��ʧ�ܷ���False}
begin
  try
    QueryPerformanceCounter(QPCounter0);
    CPUCycle0:=CPUCycleCounter();
    QueryPerformanceFrequency(QPCFrequency);
    CPUFrequency:=GetCPUFrequency(100);{��õ�ǰCPU����Ƶ}
    result:=true;
  except
    result:=false;
  end;
end;

function CPUTimeCounter():Extended;{��ȡ��ǰʱ�����(us),����CPU�ڲ�ָ�����}
var t1:int64;
begin
    t1:=CPUCycleCounter();
    result:=(t1-CPUCycle0)*1000000.0/GetCPUFrequency(); //����΢��
end;

function CPUTimeCounterQPC():Extended;{��ȡ��ǰʱ�����(us),���ø����ܼ��������}
var t1:int64;
begin
    QueryPerformanceCounter(t1);
    result:=(t1-QPCounter0)*1000000.0/QPCFrequency; //����΢��
end;


function GetCPUFrequency():int64;overload;{���CPU����Ƶ,׼ȷ����}
var t1,t2:int64;
    e1:Extended;
begin
    t2:=CPUCycleCounter();
    QueryPerformanceCounter(t1);
    e1:=(1.0*(t2-CPUCycle0)*(QPCFrequency)/(t1-QPCounter0));
    result:= trunc(e1);
end;

function GetCPUFrequency(const dTime:integer):int64;overload;{���CPU����Ƶ,׼ȷ����dTime������,dTime��λΪms}
var t0,t1,t2,t3,t4,t5:int64;
    e1:Extended;
    tmpdTime:integer;
begin
    tmpdTime:=dTime;
    if tmpdTime<1 then tmpdTime:=1;
    QueryPerformanceCounter(t0);
    t0:=CPUCycleCounter();
    //
    t3:=QPCFrequency; //QueryPerformanceFrequency(t3);
    QueryPerformanceCounter(t2);
    t1:=CPUCycleCounter();
    sleep(tmpdTime);
    QueryPerformanceCounter(t4);
    t5:=CPUCycleCounter();
    //
    e1:=(t5*1.0-t1)*t3/(t4*1.0-t2);
    result:= trunc(e1);
end;
//==============================================================================

{�ⲿAPI����}
function QueryPerformanceCounter; external 'kernel32.dll' name 'QueryPerformanceCounter';
function QueryPerformanceFrequency; external 'kernel32.dll' name 'QueryPerformanceFrequency';

//==============================================================================

initialization
//��ʼ��
begin
    CPUCallInitialize();
end;

{$ENDIF}

//==============================================================================

            {    CPU���ڼ��������  ���ߣ���˼��   2002�ꡣ    }

{CPU���ڼ�������ⵥԪ����}

end.
