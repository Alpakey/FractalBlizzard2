unit Compile_Hss;


       //////////////////////////////////////////////////////////////////////////
       //                                                                      //
       //      ��ѧ������̬������TCompile��    ����:��˼��  2002.4-2002.11     //
       //                  (������ѧ��������������Ͷ����ֺ���)                //
       //           �иĽ���������κδ�����ת����,���˲�ʤ�м���            //
       //                       E-Mail:HouSisong@GMail.com                       //
       //                      (  ת��ʱ�뱣����˵��:)  )                      //
       //                                                                      //
       //////////////////////////////////////////////////////////////////////////


       ///<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<///
       ///  <<���ܼ��>>:                                                                   ///
       ///     TCompile�����ڳ������й����ж�̬�����ѧ�������ʽ�ַ����ı���ִ��,          ///
       ///  (���Դ�����,��������,������;��̬���ɻ�����ִ��,���ǽ���ִ��)ִ���ٶȳ���!!!     ///
       ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>///

       {
         <<ʹ�÷���>>:
        var
          Compilation : TCompile; // ����CompilationΪ��ѧ������̬������TCompile���ʵ��
          str         : string;
          xValue      : TCmxFloat;
        begin
            Compilation:=TCompile.Create; //������
          try
            str:='x+sin(y*PI/2)*3';
            Compilation.SetText(str);   //strΪҪ ��ֵ����ѧ���ʽ�ַ���
            ......
            //����в���,���Ի�ò�����ַ,����ֵ (Ĭ��ֵΪ0)
            //��: PTCmxFloatX:=Compilation.GetParameterAddress('x');
            //��: PTCmxFloatY:=Compilation.GetParameterAddress('y');
            //    if (PTCmxFloatX<>nil) then PTCmxFloatX^:=1.5;
            //    if (PTCmxFloatY<>nil) then PTCmxFloatY^:=0.5;
            //Ҳ����һ�λ�����еĲ����б�:Compilation.GetParameterList(PList);
            ......
            xValue:=Compilation.GetValue(); //��ñ��ʽ��ֵ,
                                            //���Զ�θı����ֵ����ε���(�����ѭ����),����������ʾ��Ч��:)
            ......
          finally
            Compilation.Free;     //�ͷ���
          end;
        end;
       }

       
interface

  uses  SysUtils,Forms, Classes, Math;

       (*

          ��Ҫ������
              �κ��û�ʹ�ñ�������ڸ�����Ըѡ�����߲�����û�ʹ�ñ����������
          �Ķ��û����κ���ʽ����ʧ��������Ҳ����ŵ�ṩ�Ա����ά���ͷ��������
              ����������ɿ�����ʹ�ã���������������Ĵ����˵�����κ��޸ĺ�����
          ��ҵ��Ŀ�ĵ���Ϊ��Ӧ�þ���������ȡ����ϵ�����õ���Ȩ��
              ( E-Mail: HouSisong@GMail.com )

              ����ı�дĿ��ֻ���ڳ������й������ܹ���εĿ��ٵ�ִ���û������
          ��ѧ���ʽ�������Ż���Ŀ�����ٶȺ͸߾��ȣ����Ի����������Ͳ��õ���80
          λ�����ͣ��ܶ�ط��Ĵ��������ٶ�Ϊ��ҪĿ�꣬�����ڼ����׼ȷ�Ժʹ���
          �������������ʧ��

         ------------------------------------------------------------------------------

          ϣ������ܰ�æ����һ�±�������,�ر��ǵ������õ���ĳЩ�ؼ��Լ���������ʱ,��
       �ǳ��ؼ�!һ��С��bug����������!!!�����Ծ�ĳЩ������в���,���������е�һ������,
       Ȼ��ѷ��ֵĴ���ľ������������,�Ա��޸�;����ʱû�з��ִ���Ҳ�Ѳ������������,
       ��ָ�л!!!

          �ҵ� E-Mail: HouSisong@GMail.com    QQ: 9043542

         ------------------------------------------------------------------------------
       *)


       {
           ������ǰд��һ������ִ����ѧ�������ʽ�ĳ���,��Ϊ���ʹ�õ�������ִ��̫�������㲻��Ҫ��
       ���Ա�д�˱������൥Ԫ(��ѧ������̬������TCompile��)��
           TCompile���������ѧ�������ʽ�Ķ�̬�����ִ��(��̬���ɻ�����),������ִ��
       �ٶȱ���ǰ����ִ�еİ汾����5000������!�ڶ��ִ�кͱ��ʽ���������,TCompile�ڳ���
       ִ�й����ж�̬����ĺ���ִ���ٶ���Delphi6�ڳ�����ƽ׶ξ�̬�����ĺ���ִ���ٶ�
       �൱,����Щ�����������ܶ�(ע:����ʱ�ٶȱ�һ����50%-180%֮��,���ʽ�򵥵�ʱ����TCompile
       �ĵ��ÿ���̫��,Ӱ���˲��Խ��,��ֻ�Ӵ���ʵ��ִ�в�������,TCompile��Delphi6����Ŀ�ܶ�!!!)��
           ���Ի�������:Windows95��Win98��WindowsMe��Windows2000��WindowsXP��
           ���Թ���CPU���������ڡ�����A������3������2������4��
       }


       (*
       //2005.08.05

          *Ϊ������֮�����ֲ�ԣ��޸ļ���ʱ�����õ�Extended���ͣ���ΪĬ��Ϊdouble����
                 (�ڲ�ͬʱ֧��Single\Double\Extended)

       //2002.11.28-12.05

          *�Ľ��������ݺ͵���  (���Ա�������ǰ����,��ǰʹ�õķ������Լ���ʹ��)
              // ���ú������ر��ʽ��ֵ(ʵ����ֵ�б�);
              function  GetFunctionValue(const PList: array of TCmxFloat): TCmxFloat;
              // ������Ҫ������ַ���(Ҫ������ַ���,������б��ַ���); ���磺Value:='Sqr(x)+Sqr(y)'; ParameterList:='x,y' ;
              function  SetText(Const Value:string;const ParameterList : string=''):boolean;
              *���Ӻ��� IfHaveUnDefineParameter():boolean;  // �����Ƿ�ʹ����δ����ı���

          *����ǿ���Ԥ�����  Define(const Key,Value : string):boolean
              ������������������,���������µĺ���!
              �� Key:='a'; Value:='-0.5*2' , �� Key:='f(x,y)',Value:='Max(x,Sin(y))' ��;

              ����Ԥ����  DefineConst(const Key,Value: string):boolean;
                ����������(Ҫ�����ı�ʶ��,������ֵ)  // ��������, Value������һ���ɼ����ֵ
                �� Key:='a'; Value:='2' , �� Key:='b' , Value:='2*sin(PI/2)' ��;
                �ù�����ȫ������Ԥ�����(Define)�����棬
                ����ֵΪ����ʱ���������п���ʹ���õ��ı��뺯���ٶȸ��죬���ӿ�����ٶ�

          *�����ⲿ����֧��
              ����һ���ⲿ���������� �����Ϳ��Ժ�Delphi����һ��TCompile���������
              SetExteriorParameter(const PName:string;const PAddress:PTCmxFloat):boolean; //(����ǰ����,������ڱ������Ҫ����RefreshExeAddressCodeInPointerˢ�µ�ַ)


          *������������ջ���õ��Ż�����,�����ٶȽ�һ������!
             ������ʱ���ٵ��������Ĳ������У� "STѹ���ջ->������������ST->�������ݵ�ST->��Ԫ����"
                                     �Ż�Ϊ�� "������������ST->���������ST��ST(1)->��Ԫ����"

          �����Ż����ڿ���ͨ�����Թرջ��; (Ĭ��Ϊ��)
             EnabledOptimizeDiv   : Boolean; // �������: �Ƿ�Ҫ�Ż���������������� (����һ��������Ϊ����һ������)
             EnabledOptimizeStack : Boolean; // �������: �Ƿ�Ҫ�Ż���ջ����
             EnabledOptimizeConst : Boolean; // �������: �Ƿ�Ҫ�Ż���������

          *����GetUserParameterCount��GetUserParameterList��������,ʹֻ֮���ر����ĵ�ַ,�����ٰ���������ַ
             ��ǰʹ�õ���:GetParameterCount��GetParameterList��������
            (��ʵʹ������Ĵ��ݲ����б���÷�ʽ�����㣬����ֻ��Ϊ�������ܶ����ÿ��ֻ���²��ֱ���ֵ��ʱ��ʹ��)

          *�Գ��������������Ż�(����һ��������Ϊ����һ������: x/Const => x*(1/Const)),��Ϊ��������̫��
             ���ӿ������ԣ�EnabledOptimizeDiv :boolean;  //�Ƿ�Ҫ�Ż���������������� Ĭ��True

          *���Ӱ汾����

          *����bug: ���Ǵ��� '>','<','=' ǰ��Ŀո�


          *����IF���� ��ʽΪ: If(s,r1,r2) �ȼ��ڸ߼����Ե�: If (s) Then Result:=r1 Else Result:=r2;

          *����ƽ���ͺ���SqrAdd;   SqrAdd(x,y)=x*x+y*y;

          *���������η�����IntPower����,  IntPower(x,N); N��������,��Abs(N)<2^31
          *�����Ż�ָ������,���η���Ϊ������ʱ��:x^0,X^1,X^2,X^N,�ֱ�����Ż�

          �Ľ�Max��Minʹ�ٶȼӿ�;

         -------------------------------------------------------------------------
             ĳ��һ����дһ�����ʽ������ (������������)�� �����һ��ܿ������,��
         ������,�Ǳ�����,�����õ��Ǻ������÷�ʽʵ��,��̬����Ĵ���ֻ�Ǻ������õĽ�
         �ڲ���,�ٶȱ�Delphi6��5��,���⻹�ǱȽ���ִ�а汾������ǧ��!���������еĺ�
         ����������,�����ö�̬����ȫ��������ķ�ʽ,����װ����,��ʱ�ĳ����ٶȽӽ���
         Delphi6�����˲������6��(�������������˶����ֺ���),������ԼΪ5ǧ�����ҡ�
             ���߲��Ǽ����רҵ�����,�����������ߵ�һ�νӴ���ʹ�û�࣬��ȻҲ����
         �л���Ӵ�����ԭ�����֪ʶ������ֻ�� һ�߰����Լ������빹��һ��һ���ĺ�
         ��,һ�߲鿴���ͷ�Ľ��� CPU ָ��Ļ���鼮��һ�߲鿴�͸��� Delphi������
         ���ɵĻ�����(������ʾ��Ӧ�Ļ����,��лBorland��ǿ�������)��һ�߲ο� VC��
         Delphi(��лBorland��Դ��Ϳ���)����Щ������ʵ�ַ�ʽ... ��һ�����Ҵ�ѧ����
         ��������������ŷ�æ��һ�ܣ���Ҳ������Ȥ��һ��:)

                       ( д��2002.11.29,������һ��  ��˼�� )
         -------------------------------------------------------------------------

       *)

       (*
       //2002.11.5-11.8
         �Ľ�ArcCotH��ArcCscH��ArcSecHʹ�ٶȼӿ�,
           ��ǰ���õ��Ǻ������ã����ڲ��û����ֱ�ӹ�ʽ����;
         �Ľ�ArcCot����;

         �Ľ���������ĵ��÷�ʽ(���ú�����������),
           ����ڱ��ʽ�϶�ʱ��ӿ��ٶȣ������ڱ��ʽ�ϳ�ʱ����5%����;

         �Ľ�ϵͳ�ڲ�ʹ�õĳ�����ϵͳ������������ʽ,ʹ֮��ͳһ
           'Boolean??'        ��Ϊ:  'TCmSYS_Boolean??'      ,
           'Const_SYS_*'      ��Ϊ:  'TCmSYS_Const_*'        ,
           'Const_SYS_ff_x_*' ��Ϊ:  'TCmSYS_Const_ff_x_*'   ,
           'FF_SYS_*'         ��Ϊ:  'TCmSYS_FF_*'           ;
           
       //2002.11.5-11.8
       *)

       (*
       //2002.8
          ������£��б����£�

          *�����˲�������; �����߼�������ͱȽ������ (ʹ�òμ���ϸ˵��)
               �߼����� ��     true =1
               �߼����� ��     false =0
               �߼����� ��     AND
               �߼����� ��     OR
               �߼����� ���   XOR
               �߼����� ��     NOT
               ���            =
               ������          <>
               С��            <
               ����            >
               С�ڵ���        <=
               ���ڵ���        >=

          !��ʶ�� PI ���ڱ�����ϵͳ���� PI=3.1415926...
           ��ʶ�� e ϵͳ������Ĭ��ֵΪ2.718281828...������������¸�ֵ����PI��ͬ

          !���ڸ���һ����������ȼ���
             �ɸߵ���
             ()             (�������ֺ���)
             ^
             *  \  /  mod
             +  -
             =  <>  <  >  <=  >=
             AND��OR��XOR  (NOT ���Կ�������)

       //2002.8
       *)


       (*

       // Power(x,2) �Ż�����
       // Power(x,0) �Ż�����

       //2002.7-2002.8
          �������һЩ�޸ĺͳ�����,����:

        <<�����б�>>:

          *����һЩ�Ż�,�ٶ��ּӿ���25%! ���ڱ�������ִ��Ч�ʸ���(���������ݶ���)��

          *Ϊ�˼���TCompile������ʱռ�õ��ڴ�ռ�,�������˶�̬���ڴ�ռ����뷽ʽ,
           ���Ҷ��ܱ�����ı����ȼ�����������(ֻ�����ڴ�ͱ���ʱ���ϵͳӰ��),
           �����������Թ��ϰ�K�ı��ʽ���������:);

          *�����˴����,�����ڽ�������������Ϊ��������(������������������:���ķ���BIG5��Ĵ���������Ӣ�İ�Ĵ�������);
          *���������ڱ��ʽ��ʹ��ע��(TCopmile.EnabledNote:=true;Ĭ��Ϊfalse),ע��д��Ϊ:
              ����ע��:  ˫б��// ��ʼ��һ�н���(�������س����з�)
              ����ע��:  '{'��'}' ��'/*'��'*/' ֮��Ĳ���

          !!!�ؼ����в��������ո���ַ�;
              ��ǰ�汾 �� "Si n (P I/2)" ������������ ����"Sin(PI/2)", "d 45"����Ϊ��"d45",���ڲ�������!

          !!!Ϊ�˱������,�ο���ѧ�ֲ����¶Ա��ʽ�е���ѧ�������ƺͱ��������޶�,ʹ�ù���ǰ�汾����ע��һ��;

          *���¿����˸���״̬��־��RC����ֵ�Ը���������ȡ������ĺ�����Ӱ��

          !!!��������:
              ���������Ż�ʱ�� ���ຯ��'Mod'���Ż�����   �����: 10 mod 7=9 !  Ӧ��Ϊ: 10 mod 7=3
              ԭ������:  ConstdValue:=T_PTrueOld.dValue-Trunc(T_PTrueOld.dValue/T_PTrueNow.dValue)
              ��Ϊ:      ConstdValue:=T_PTrueOld.dValue-Trunc(T_PTrueOld.dValue/T_PTrueNow.dValue)*T_PTrueNow.dValue

          !!!��������:
              ���������Ż�ʱ�� ������2����'ArcTan2'���Ż�����
              ԭ������:  ConstdValue:=math.ArcTan2(T_PTrueNow.dValue,T_PTrueOld.dValue)
              ��Ϊ:      ConstdValue:=math.ArcTan2(T_PTrueOld.dValue,T_PTrueNow.dValue)

          !!!��������:
              ���������Ż�ʱ�� ȡ������'Int'���Ż�����   �����: Int(-1.5)=-1 ! Ӧ��Ϊ: Int(-1.5)=-2  (RC��ȡ����ʽ��ɵ�)
              ԭ������:  ConstdValue:=Trunc(T_PTrueNow.dValue)
              ��Ϊ:      xTemp:=Trunc(T_PTrueNow.dValue);
                         if Frac(T_PTrueNow.dValue) <0 then
                           xTemp:=xTemp-1;
                         ConstdValue:=xTemp;

          !!!��������:
              �����˱����Ӻ��� ��������TCompile.F_DivE();  ����: c:=-10; c\7=-2 ! Ӧ��Ϊ: c\7=-1  (RC��ȡ����ʽ��ɵ�)
              (��ȫ��д �����޸���)

          *�����˱��ʽ�жԽض�ȡ������Trunc��֧��, ����дΪ:Trunc(x)   (����ȡ��)
          *�����˱��ʽ�жԽض�ȡ������Ceil��֧��, ����дΪ:Ceil(x)     (���������ȡ��)
          *�����˱��ʽ����������ȡ������Round��֧��, ����дΪ:Round(x)   (��������ȡ��)
              ע: Int(x)��Floor(x)����ֵΪ������x���������  (�������ȡ��)

          *�����˱��ʽ�ж��������Random��֧��, ����дΪ:Random(x)��RND(x)��Rand(x)
              ��ʹ��"TCopmile.SetRandomize();"������ʼ���������

          *�����˱��ʽ�ж����к���Cot��֧��;
          *�����˱��ʽ�ж������Sec��֧��;
          *�����˱��ʽ�ж�����Csc��֧��;
          *�����˱��ʽ�жԷ����к���ArcCot��֧��;
          *�����˱��ʽ�жԷ������ArcSec��֧��;
          *�����˱��ʽ�жԷ�����ArcCsc��֧��;

          *�����˱��ʽ�ж�˫�����к���CotH��֧��;
          *�����˱��ʽ�ж�˫�������SecH��֧��;
          *�����˱��ʽ�ж�˫������CscH��֧��;
          *�����˱��ʽ�жԷ�˫�����к���ArcCotH��֧��;
          *�����˱��ʽ�жԷ�˫�������ArcSecH��֧��;
          *�����˱��ʽ�жԷ�˫������ArcCscH��֧��;

          *�����˱��ʽ�ж�б�ߺ���Hypot��֧��;
          *�����˱��ʽ�ж���������Rev��֧��;

          �η��������ڿ���дΪ:  x**y��x^y��Power(x,y)
          �����������ڿ���дΪ:  x%y ��x Mod y ��Mod(x,y)

       //2002.7-2002.8
       *)

       {
       //2002.5-2002.6

          ��ɿ��
          
       //2002.5-2002.6
       }

       /////////////////////////////////////////////////////////////////////////
       /////////////////////////////////////////////////////////////////////////

       
       (*

       <<��ϸ˵��>>:

       0.֧����ѧ�������ʽ�ı���ִ��;

       1.֧�ִ���������,����Ĭ��ֵΪ0;����ǰ�븳ֵ;

       2.���������ÿ�ѧ��������ʾ,��: -1.4E-4=-0.00014;
         ϵͳ����ĳ���:  Բ���� PI=3.1415926535897932384626433832795...
                          �߼��� true=1
                          �߼��� false=0
         ����ʶ��Ϊeʱ��ϵͳĬ��ֵΪ ��Ȼ��
           �� e=2.7182818284590452353602874713527...
           ������PI,true,false��ͬ��e�������¸�ֵ, pi,true,false��ϵͳ������e���û�����



       3.ʹ�ö������Ų����ή���ٶ�,�ر����ڲ����׷�����������ȼ���ʱ��,���ʹ������;

       4.���ʽ�к������Ͳ������Ȳ����ִ�Сд;�ؼ����в��������ո���ַ�;

       5.������ı����ȼ�����������(ֻ�����ڴ�ͱ���ʱ���ϵͳӰ��)

       6.���ô���Ź��ܿ��Խ�������������Ϊ��������(������������������:���ķ���BIG5��Ĵ���������Ӣ�İ�Ĵ�������);

       7.�����ڱ��ʽ��ʹ��ע��(TCopmile.EnabledNote:=true;),ע��д��Ϊ:
              ����ע��:  ˫б��// ��ʼ��һ�н���(�������س����з�)                                                      
              ����ע��:  '{'��'}' ��'/*'��'*/' ֮��Ĳ���

       8.ϵͳʹ�õı�ʶ����ȥ�����г��ĺ�����(��������)�⻹�� :
         'PI'��'true'��'false'��'TCmSYS_IF_?'��'TCmSYS_Boolean??'��'TCmSYS_Const_*' ��
         'TCmSYS_Const_ff_x_*'��'TCmSYS_DefineFPName_???'�� 'TCmSYS_FF_*' ��,
         �Զ���ı�ʶ�������벻Ҫ�ٴ�ʹ������;  (��ǰ׺����Ϊ'TCmSYS_')

       9.֧�ֵĺ���:

         �����ʵ����Ϊ:  R' ,  R'ԼΪ (-1.1E+4932,-3.6E-4951) and [ 0 ] and (+3.6E-4951,+1.1E+4932)
         ��ʵ������(+-3.6E-4951,0) ʱ��Ϊʵ������0
         û���ر�˵���ı���ȡֵ��ΧΪʵ���� R'

       (��������Ľ�����м���Ҳ���ܳ���ʵ���� R')

       ���(����)����       ��д��ʽ�ͱ���ȡֵ��Χ                       ����(˵��)

       +        �ӷ�        x+y     ����: Add(x,y)                       3.5+5=8.5
       -        ����        x-y     ����: Sub(x,y)                       8-3=5
       *        �˷�        x*y     ����: Mul(x,y)                       2*3=6
       /        ����        x/y     ����: Div(x,y)   ; y<>0              3/2=1.5
       \        ����        x\y     ����: DivE(x,y)  ; y<>0              25\10=2
       Mod      ����        x Mod y   ����: x%y��Mod(x,y) ; y<>0         14 Mod 5=4
       ^        ָ��        x^y     ����:  Power(x,y)��x**y              2^3=8
                            ; x<0ʱ,y����Ϊ����
                            ; x=0ʱ,y>0
       IntPower �����η�    IntPower(x,N); N<2^31                        IntPower(5,3)=125

           ;�Ƚ���������Ľ��Ϊ�߼�ֵ(����)�������ֻ����Ϊ1��0
       =        ����        x=y                                          (2=3-1) =true =1
       <>       ������      x<>y                                         (2<>3-1) =false =0
       <        С��        x<y                                          (2<3) =true
       >        ����        x>y                                          (2>3) =false
       <=       С�ڵ���    x<=y                                         (sin(a)<=1) =true
       >=       ���ڵ���    x>=y                                         (3>=PI) =false

           ;�߼������� 0��ʾ ��(false),��0�ᱻ���� ��(true)���μ��߼�����
           ;�ô�дX,Y��ʾ�߼�ֵ��ʵ��(ע�����д����)
       ADD      �߼���      (X) ADD (Y)                                  (1>2) AND (true)=false
       OR       �߼���      (X) OR (Y)                                   (false) OR (true)=true
       XOR      �߼����    (X) XOR (Y)                                  (true) XOR (true)=false
       NOT      �߼���      NOT (X)                                      NOT (1)=false

       Max      ���ֵ      Max(x,y)                                     Max(3,4)=4
       Min      ��Сֵ      Min(x,y)                                     Min(3,4)=3
       Sqr      ƽ��        Sqr(x)                                       Sqr(3)=9  //ע��ƽ���Ϳ����ĺ�������
       Sqr3     ����        Sqr3(x)                                      Sqr3(3)=27
       Sqr4     �Ĵη�      Sqr4(x)                                      Sqr4(3)=81
       Sqrt     ����        Sqrt(x)    ; x>=0                            Sqrt(3)=1.73205080756888

       Exp      ��Ȼָ��    Exp(x)                                       Exp(2)=e*e=e^2
       Ln       ��Ȼ����    Ln(x)                    ; x>0               Ln(e)=1
       Log2     2�Ķ���     Log2(x)                  ; x>0               Log2(8)=3
       Log10    10�Ķ���    Log10(x) ����: Log(x)    ; x>0               Log(100)=2

       Abs      ����ֵ      Abs(x)                                       Abs(-2)=2 ; Abs(2)=2
       SqrAdd   ƽ����      SqrAdd(x,y)                                  sqrAdd(3,4)=25
       Rev      ����        Rev(x)                                       Rev(5)=1/5=0.2
       Int      ȡ��        Int(x)   ����: Floor(x)                      (������x���������) Int(2.3)=2 ; Int(-2.3)=-3
       Trunc    �ض�ȡ��    Trunc(x)                                     (����ȡ��) Trunc(2.3)=2 ; Trunc(-2.3)=-2
       Round    ��������    Round(x)                                     (��������ȡ��)  Round(2.51)=3 ; Round(2.49)=2
       Ceil     ����ȡ��    Ceil(x)                                      (�������ȡ��)  Ceil(-2.2)=-2 ; Ceil(2.8)=3
       Sgn      ���ź���    Sgn(x)                                       Sgn(-2)=-1 ;  Sgn(0)=0 ; Sgn(2)=1
       Hypot    б��        Hypot(x,y)                                   Hypot(x,y)=Sqrt(x*x+y*y)
       Random   �������    Random(x) ����:RND(x)��Rand(x)               Random(2.5)=2.5*a ,����aΪ�����0<=a<1
               (Ҫ���������������,�����ǹ̶����������,���ڴ����������ɺ�
                ȡ�ñ��ʽֵ֮ǰ����һ��TCopmile.SetRandomize();������)

       Sin      ����        Sin(x)                                       Sin(pi/6)=0.5
       Cos      ����        Cos(x)                                       Cos(0)=1
       Tan      ����        Tan(x)   ����: tg(x)                         Tan(pi/4)=1
       ArcSin   ������      ArcSin(x)    ; -1<=x<=1                      ArcSin(1)=1.5707963267949=pi/2
       ArcCos   ������      ArcCos(x)    ; -1<=x<=1                      ArcCos(0)=1
       ArcTan   ������      ArcTan(x) ����:  Arctg(x)                    ArcTan(1)=0.785398163397448=pi/4
       ArcTan2  ������2     ArcTan2(y,x) ����:  Arctg2(y,x)              ArcTan2(2,1)=1.10714871779409
                            ;yΪ�����ꡢxΪ������
       Cot      ����        Cot(x)    ����: Ctg(x)   ;x<>0               Cot(x)=1/Tan(x)
       Sec      ����        Sec(x)                                       Sec(x)=1/Cos(x)
       Csc      ���        Csc(x)                   ;x<>0               Csc(x)=1/Sin(x)
       ArcCot   �����к���  ArcCot(x) ����: ArcCtg(x)   ;x<>0            ArcCtg(x)=ArcTan(1/X)  //Delphi6 ��Ϊ ArcCtg(x)=Tan(1/X)  !
       ArcSec   �������  ArcSec(x)              ;|x|>=1               ArcSec(x)=ArcCos(1/X)  //Delphi6 ��Ϊ ArcSec(x)=Cos(1/X)  !
       ArcCsc   ������  ArcCsc(x)              ;|x|>=1               ArcCsc(x)=ArcSin(1/X)  //Delphi6 ��Ϊ ArcCsc(x)=Sin(1/X)  !

       SinH     ˫������    SinH(x)                                      SinH(2)=3.62686040784702=(e^2-e^(-2))/2
       CosH     ˫������    CosH(x)                                      CosH(2)=3.76219569108363=(e^2+e^(-2))/2
       TanH     ˫������    TanH(x)  ����: tgH(x)                        TanH(2)=0.964027580075817=SinH(2)/CosH(2)
       ArcSinH  ��˫������  ArcSinH(x)                                   ArcSinH(3.62686040784702)=2
       ArcCosH  ��˫������  ArcCosH(x)         ; x>=1                    ArcCosH(3.76219569108363)=2
       ArcTanH  ��˫������  ArcTanH(x)  ����: ArctgH(x)                  ArcTanH(0.761594155955765)=1
       CotH     ˫������       CotH(x)  ����: CtgH(x)  ;x<>0             CotH(x)=1/TanH(x)
       SecH     ˫������       SecH(x)                                   SecH(x)=1/CosH(x)
       CscH     ˫�����       CscH(x)       ;x<>0                       CscH(x)=1/SinH(x)
       ArcCotH  ��˫�����к��� ArcCotH(x) ����: ArcCtgH(x)   ;x<>0       ArcCtgH(x)=ArcTanH(1/X)  //Delphi6 ��Ϊ ArcCotH(x)=1/ArcCot(X) !
       ArcSecH  ��˫������� ArcSecH(x)      ;0<x<=1                   ArcSecH(x)=ArcCosH(1/X)  //Delphi6 ��Ϊ ArcSecH(x)=1/ArcSec(X) !
       ArcCscH  ��˫������ ArcCscH(x)      ;x<>0                     ArcCscH(x)=ArcSinH(1/X)  //Delphi6 ��Ϊ ArcCscH(x)=1/ArcCsc(X) !
                                                                               //Delphi7 ��Ϊ��ArcCscH(x)= Ln(Sqrt(1+(1/(X*X))+(1/X)));!!
       If       ��������    If(s,r1,r2)                                  If(True,2,3)=2; If(0,2,3)=3;
                (�ȼ��ڸ߼����Ե�: If (s) Then Result:=r1 Else Result:=r2;)

       ff       �����ֺ���  ff(a,b,x,g(x)) ����: ff(a,b,x,N,g(x))        ff(-1,1,y,Sqrt(1-y*y))=pi/2

                ( ff�����ر�˵��:
                  ����g(x)�ǹ���'x'�ı��ʽ(Ҳ���Բ����б���x),������Ա���x�뱾����ff�����xû�й�ϵ;

                  ff������ʾ �Ժ��� g(x) �� a ���� b ����,
                             x��ʾ��xΪ���ֱ����Ժ���g(x)����, (�������Ա������Ʊ�ʶ��)
                             N (N>0) ��ʾ �ѻ�������ֳ� N ������ ,ʡ�� N ʱĬ��Ϊ 1000 ;

                  ���ֺ���֧�ֶ��ػ���(����)
                  (ע��: ���ػ��ֺͻ�����Ƕ����һ����˼)

                  ������λ��������(R=1)
                  ���ػ��ֱ��ʽΪ:
                  ff(-1,1,x,                          //x��-1��1����
                     ff(-Sqrt(1-x*x),Sqrt(1-x*x),y,   //y��-Sqrt(1-x*x)��sqrt(1-x*x)����
                        2*Sqrt(1-x*x-y*y)
                       )
                    )

                  =4.18883330446894
                  =4*Pi/3
                  =ff(-1,1,x,PI*(1-x*x))   // (��λ���������һ�ػ��ֱ��ʽ)
                )

       10. ��������ȼ���
             �ɸߵ���
             ()             (�������ֺ���)
             ^
             *  \  /  mod
             +  -
             =  <>  <  >  <=  >=
             AND��OR��XOR  (NOT ���Կ�������)

       11. ��ǿ��Ĺ�����ο���Ľӿں���

       *)

  {$A8}{$A+}
  //{$DEFINE FloatType_Single}
  //{$DEFINE FloatType_Double}
  {$DEFINE FloatType_Extended} //����:��������extended����ı߽����������

  (* ��������extended����ı߽����������
     {$A8}{$A+}
     type T0 = record
         x,y : Extended;
       end;
     type T1 = record
         x : Extended;
         y : Extended;
       end;
     type T2 = array [0..1] of Extended;
     ///
     ���: sizeof(T0)==12;
           sizeof(T1)==16;
           sizeof(T2)==10;
  *)


  {$IFDEF FloatType_Extended}
    type TCmxFloat=Extended;   //��չ����
  {$ENDIF}
  {$IFDEF FloatType_Double}
    type TCmxFloat=Double;     //˫����
  {$ENDIF}
  {$IFDEF FloatType_Single}
    type TCmxFloat=Single;     //������
  {$ENDIF}

  type _tmpCmxFloatArray = array [0..1] of TCmxFloat;
       PCmxFloatArray =^_tmpCmxFloatArray;
  const SYS_ArrayOneLength = sizeof(_tmpCmxFloatArray) div 2;

  type PTCmxFloat=^TCmxFloat;
  type _tmpTwoTCmxFloat=record
      x   : TCmxFloat;
      y   : TCmxFloat;
  end;
  const SYS_EFLength = sizeof(_tmpTwoTCmxFloat) div 2;

  {$if SYS_EFLength=16}
  {$define FloatType_Extended}
  {$ifend}
  {$if SYS_EFLength=8}
  {$define FloatType_Double}
  {$ifend}
  {$if SYS_EFLength=4}
  {$define FloatType_Single}
  {$ifend}

  type TFunctionList =record
    FName     :string;     //��������
    FAddress  :Pointer;    //������ַ���
    FCCount   :0..2;       //���������������
  end;

  type TParameterList =record
    CName     :String;     //��������
    CAddress  :PTCmxFloat;  //������ַ
    CIndex    :integer;    //������ַ��� (��ExeParameter�е�λ�����,ϵͳʹ��)
    IsConst   :boolean;    //�Ƿ�Ϊ����;  false:���� true:����
    IsExterior:boolean;    //�Ƿ����ⲿ���� false:�ڲ����� true:�ⲿ����
  end;
  const SizeofTParameterList=sizeof(TParameterList);

  type TUserParameterList =record   //�û�ʹ�� (ϵͳ�� TParameterList)
    CName     :String;     //��������
    CAddress  :PTCmxFloat;  //������ַ
  end;

  type TT_PTrue=record
    isConst   :boolean;    //�����Ż�����ʱ  ��������  �Ƿ�Ϊ����
    dValue    :TCmxFloat;   //�����Ż�����ʱ  ��������  ֵ
  end;

  type TExeAddressPMList=record
    ExeIndex  :integer;     //����ExeCode�ĵ�ǰλ�����
    PName     :string;       //��������
  end;



////////////////////////////////////////////////////////////////////////////////

const
  // �汾
  csTCompile_Version :double =1.44;  //2008.7 ����extended��������һ��bug
    //csTCompile_Version :double =1.43;  //2002.11.28-12.03    �Ľ��������ú͵��á��Ż���������������������ջ���Ż�����������ǿ���Ԥ����ꡢ�����ⲿ����֧��
    // csTCompile_Version :double =1.31   //2002.11.5-11.8   С�ĸĽ����޸��û����÷�ʽ��
    // csTCompile_Version :double =1.30;  //2002.8           ���Ӳ���������߼�����֧�ֵ�
    // csTCompile_Version :double =1.20;  //2002.7-2002.8    �Ľ���������������ע�͹��ܡ����Ӵ���������
    // csTCompile_Version :double =1.10;  //2002.5-2002.6    �Ľ��������Գ�����������Ż���
    // csTCompile_Version :double =1.00;  //2002.5           ��ɿ��

type
  TCompile=class    // <<��ѧ������̬������TCompile��>>

  protected  {˽��}

    FEnabledNote    :boolean;
    FEnabledOptimizeDiv :boolean;
    FEnabledOptimizeStack  :boolean;
    FEnabledOptimizeConst  :boolean;
    procedure SetEnabledNote(Value:boolean);  //�Ƿ�����ʹ��ע�� ˽��
    procedure SetEnabledOptimizeDiv(Value:boolean);  //�Ƿ�Ҫ�Ż���������������� ˽��
    procedure SetEnabledOptimizeStack(Value:boolean);  //�Ƿ�Ҫ�Ż���ջ ˽��
    procedure SetEnabledOptimizeConst(Value:boolean);  //�Ƿ�Ҫ�Ż��������� ˽��

  public
  
    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
    //    <<����ɼ���Ա �� �ӿڲ���>>    //
    //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<//

    //Enabled   :boolean;    // �Ƿ���Ч

    // ���ú������ر��ʽ��ֵ;
    GetValue:Function():TCmxFloat;     // (�������ܵ���)
    // ���ú������ر��ʽ��ֵ(ʵ����ֵ�б�); //�ȼ��� SetFunctionParameter + GetValue
    function  GetFunctionValue(const PList: array of TCmxFloat): TCmxFloat;  // (�������ܵ���)
    // ����ǰ���õĲ����������ֵ(ʵ����ֵ�б�)
    procedure SetFunctionParameter(const PList: array of TCmxFloat);  // (����ǰ���ܵ���)

    // ������Ҫ������ַ���(Ҫ������ַ���,������б��ַ���,�Ƿ��Զ�����);
    //    ���磺Value:='Sqr(x)+Sqr(y)'; ParameterList:='x,y' ;
    function  SetText(const Value:string;const ParameterList : string='';const IfCompile:boolean=true):boolean;//(����ǰ���ã���������Ҫ����)
    // ���뵱ǰ�ַ���
    function  Compile():boolean;

    // ����Ԥ�����(Ҫ�����ı�ʶ��,����Ϊ�������ַ���); // ��������������,���������µĺ���!
    //   �� Key:='a'; Value:='-0.5' , �� Key:='f(x,y)',Value:='Max(x,Sin(y))' ��;
    function  Define(const Key,Value : string):boolean; //(����ǰ����)

    // ����������(Ҫ�����ı�ʶ��,������ֵ)  // ��������, Value������һ���ɼ����ֵ
    //   �� Key:='a'; Value:='2' , �� Key:='b' , Value:='2*sin(PI/2)' ��;
    //   �ù�����ȫ������Ԥ�����(Define)�����棬
    //   ����ֵΪ����ʱ���������п���ʹ���õ��ı��뺯���ٶȸ��죬���ӿ�����ٶ�
    function  DefineConst(const Key,Value: string):boolean; //(����ǰ����)

    // �����Ƿ�ʹ����δ����ı���
    function  IfHaveUnDefineParameter():boolean;  //(�������ܵ���)

    //��õ�ǰҪ������ַ���
    function  GetText():string;   //��ʱ�����Ե��ã���ֵ���������������ĵ��ö������仯

    // ��ð汾��
    class Function GetVersion():double;

    // �������: �Ƿ�����ʹ��ע��
    property  EnabledNote: Boolean read FEnabledNote write SetEnabledNote default true; //(����ǰ����)
    // �������: �Ƿ�Ҫ�Ż���������������� (����һ��������Ϊ����һ������)
    property  EnabledOptimizeDiv: Boolean read FEnabledOptimizeDiv write SetEnabledOptimizeDiv default true;//(����ǰ����)
    // �������: �Ƿ�Ҫ�Ż���ջ����
    property  EnabledOptimizeStack: Boolean read FEnabledOptimizeStack write SetEnabledOptimizeStack default true; //(����ǰ����)
    // �������: �Ƿ�Ҫ�Ż���������
    property  EnabledOptimizeConst: Boolean read FEnabledOptimizeConst write SetEnabledOptimizeConst default true; //(����ǰ����)


    //����һ���ⲿ����(�ⲿ�������ƣ��ⲿ������ַ); �����Ϳ��Ժ�Delphi����һ��TCompile���������
    function  SetExteriorParameter(const PName:string;const PAddress:PTCmxFloat):boolean;overload;
              //(����ǰ����,������ڱ������Ҫ����RefreshExeAddressCodeInPointerˢ�µ�ַ)
      // �����ⲿ����(��������,�����ַ);
      function  SetExteriorArrayParameter(const ArrayPName:string;const ArrayPAddress:PTCmxFloat):boolean;
      function  SetExteriorParameter(const PNameList:array of string;const PAddressList:array of PTCmxFloat):boolean;overload;
      procedure RefreshExeAddressCodeInPointer();  //ˢ�±����ַ  //(���������е��ⲿ�����Ժ���Ҫ����һ�θú���)

    //���ݲ�������PName�õ�������ֵַ
    function  GetParameterAddress(const PName:string):PTCmxFloat;
    //����������PName���ò���ֵdValue
    function  SetParameter(const PName:string;const dValue:TCmxFloat):boolean;overload;
    //��������ַPAddress���ò���ֵdValue
    procedure SetParameter(const PAddress:PTCmxFloat;const dValue:TCmxFloat);overload;
    //�õ�����PName��ֵ
    function  GetParameterValue(const PName:string):TCmxFloat;
    //�õ�����������Ŀ(����������)
    Function  GetUserParameterCount():integer;
    //�����û����õĲ�������Ŀ
    Function  GetFunctionPlistCount():integer;   //��װVBʹ�õ�API����ʱ�õ� 2003.3.29����
    //ͨ��PList���ز����б�(����������)
    procedure GetUserParameterList(var PList:array of TUserParameterList);
    //�õ�����������Ŀ(��������)
    Function  GetParameterCount():integer;
    //ͨ��PList���ز����б�(��������)
    procedure GetParameterList(var PList:array of TParameterList);
    //���Բ���PName�Ƿ��Ѿ�����
    function  IfHaveParameter(const PName:string):boolean;overload;
    //���Գ���dValue�Ƿ��Ѿ����� ��ͨ��cName���س�������
    function  IfHaveParameter(const dValue:TCmxFloat;var cName:string):boolean;overload;

    //���ش�������
    function  GetError():string;
    //���ش�������
    function  GetErrorCode():integer;
    //���ش�������(���ļ���) Ҫ���Ĵ�����������Ϊ��������ʱ���д�˺���
    function  GetErrorGB(const xErrorCode{��������}:integer):string;overload;
    //���ش�������(���ķ���) ���Ǹ�������
    function  GetErrorBIG5(const xErrorCode:integer):string;overload;
    //���ش�������(Ӣ��) ���Ǹ�������,Ӣ��ˮƽ����,ϣ���д�Ϻ����:)
    function  GetErrorEnglish(const xErrorCode:integer):string;overload;
    //���ر����Ժ�ĳ���ָ�������볤��(�ֽ�)
    Function  GetExeCodeLength():integer;
    //���ر����Ժ�ĳ������������볤��(�ֽ�)
    Function  GetExeParameterLength():integer;

    
    //�����������Rnd()�ĳ�ʼ����ֵΪ��ȫ�������(ϵͳ�õ�ǰ��ȷ�������ʱ������)
    procedure SetRandomize();overload;
    //�����������Random()�ĳ�ʼ����ֵ
    procedure SetRandomize(const RandomSeed :integer);overload;
     
  public
    //�����û�����ʹ�õ�δ��������,�û��������������Լ�������
    //�౾������ʹ��
    Tag         : integer;
    Tag_F       : TCmxFloat;
    Tag_P       : Pointer;

  protected

    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
    //         << ˽�� ���� >>            //
    //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<//

    FExeText        :string;      //���ʽ
    ErrorCode       :integer;     //������������

    RndSeed         :array [0..1] of integer;  //�����������ֵ

    FunctionList    :array [0..128-1] of TFunctionList;     //�����б�,�Ѿ���60���������(��������)
    PFunctionList   :integer;                               //��ǰ������Ϣ���뺯���б�λ��

    FunctionStack   :array  of string;         //�������ŵ��ö�ջ
    PFunctionStack  :integer;                  //�������ŵ��ö�ջ ��ǰ����λ��

    ExeAddressCode  :array of byte; //�����Ժ��ִ����
    PExeAddressCode :integer;       //��ǰ�������ָ��λ��

    ExeAddressList  :array of integer;  //��¼ָ��λ���б�(��Ϊ���ֺ����õ�)
    PExeAddressList :integer;           //��ǰ����λ��

    ExeAddressPMList  :array of TExeAddressPMList;  //��¼ָ��λ���б�(��Ϊ�����洢��ַ�õ�)
    PExeAddressPMList :integer;           //��ǰ����λ��

    ExeAddressTempData  :array [0..16*1024-1] of byte; //��ʱ���ݽ�����ַ
    ExeAddressStack     :array [0..16*1024-1] of byte; //���ݶ�ջ��ַ

    ParameterList     :array  of TParameterList;   //�����б�
    PParameterList    :integer; //��������б�ǰ����λ��

    ExeParameter      :array  of byte; //����� ��������ռ�
    PExeParameter     :integer; //����� ������ַ ,��ǰ�������λ��
                                //PExeParameterList:=@ExeParameter[PExeParameter]

    TF00            :string;    // �ȽϷ������ȼ�ʱ Tf00 ����������һ�εķ���

    T_SYS_FF_ConstN :integer;   //���ֱ��� ���

    T_PTrueNow      :TT_PTrue;  //�����Ż�����ʱ  ��ǰ��������
    T_PTrueOld      :TT_PTrue;  //�����Ż�����ʱ  ��һ����������
    T_PTrueNowList  :array  of TT_PTrue; //�����Ż�����ʱ  �������ʶ�ջ
    PT_PTrueNowList :integer;            //��ǰ�������ʶ�ջ����λ��

    CompileInPFirst :integer;   //�ڼ��ε���CompileInP()

    FFunctionPlistCount : integer; // ���ɺ����Ĳ�������;
    FFunctionPListIsSet : boolean; // �Ƿ������˲����б�;


    {˽�к���}
    procedure Clear();
    function  Parsing(var str:string):boolean;//��һ���﷨����
    function  CheckBK(const str:string):boolean;//������Լ��
    procedure CompileInP(const PName:string); //���� ������ջ�������
    procedure CompileInPReNew(const dValue:TCmxFloat;const Pm:integer); //���� ������ջ������� (�滻)
    procedure CompileOutP(); //���� ��������
    procedure CompileInF(const FName:string); //���� ��������
    function  GetSign(var str:string):string; //���� str �ĵ�һ��������
    function  CompareSign(const FName1 : string;const FName2 :string): integer; //�ȽϷ��ŵ����ȼ�
    procedure CheckWording(const T1 : string;const T2 : string) ;// �����Ⱥ��ϵ����﷨����

    // ���ò������ø�ʽ(������б��ַ���); ���磺ParameterList='x,y' ;
    function  SetFunctionCallFormart(const ParameterList : string):boolean;

    procedure ExeAddressCodeIn(const B:Byte);  overload;      //�������CPUָ��
    procedure ExeAddressCodeIn(const B:array of Byte); overload;
    procedure ExeAddressCodeIn(const sB:string);  overload;
    procedure GetExeAddressCodeInPointerRePm(const PName:string);  //��¼����ָ���в���Ĳ�������,�����ַʱ�Ա����
    Function  GetExeAddressCodeInPointerReCode():Pointer; //��¼����ָ���в����ִ��ƫ�Ƶ�ַ,�����ַʱ�Ա����
    function  OptimizeStackCall(const IfFxch:boolean=true):boolean; // �Ż���ջ����

    procedure FunctionListIn(const s:string;const F:Pointer;const iCount:integer);//��֧�ֵĺ������뺯���б�
    procedure GetFunctionList();                                 //��ú����б�
    Function  GetFunctionIndex(const fName:string):integer;      //���ָ�����ƺ��������
    function  IfHaveFunction (const fName:string):boolean;       //�ж�ָ�����ƺ����Ƿ��Ѿ��ں����б���

    procedure FunctionStackIn(const s:string);    //
    Function  FunctionStackOut():string;          //����  �������ŵ��ö�ջ
    Function  FunctionStackRead():string;         //

    function  ParameterListIn(const PName:string):integer;overload;  //���������������ջ  �������
    function  GetParameterListConstIndex(const PName:string):integer;
    function  ParameterListIn(const dValue:TCmxFloat):string;overload; //���������������ջ ��������ϵͳ����ı���
    function  GetParameterIndex(const PName:string):integer;       //�õ�ָ�����Ʋ�����ParameterList[]�е����

    procedure T_PTrueNowListIN(const TP:TT_PTrue);  //����   (�����Ż�����ʱ) �������ʶ�ջ
    function  T_PTrueNowListOut():TT_PTrue;         //

    //�������str,ͨ��s����
    function  Dbxch(var s:string;var str:string):boolean; // ��д��ʽת������  f(x,y) => ((x)f(y))
    function  DbxchSYS_ff(var s:string;var str:string):boolean; // ��д��ʽת������ ff(a,b,x,N,g(x)) => ( (a) TCmSYS_FF_0 (b) TCmSYS_FF_1 (N) TCmSYS_FF_2 ( g(x) ) )

    function  DbxchSYS_FunctionIf(var s:string;var str:string):boolean; // ��д��ʽת������  If(a,b,c) =>TCmSYS_IF_1(TCmSYS_IF_0(b,c),a)

    function  DefineMarker(var Text:string;const Key,Value : string):boolean;  // �滻��ʶ�� ��Text �� Key=>Value

    procedure DelStrNote(var str:string); // ȥ��strע�Ͳ���



    function  ifSYS_ff(const fName:string):boolean;  // fName ���Ƿ��� ���ֺ���
    function  getSYS_ff(const fName:string):string;  // ���ػ��ֺ�������

    {���� ����}
    //Լ��:  ��Ԫ���� ͨ�� st ������ֵ ,ͨ�� st ���ؽ��ֵ
    //       ˫Ԫ���� ͨ�� st ����һ����ֵ,ͨ�� [ecx] ���ڶ������� ,ͨ�� st ���ؽ��ֵ
    //       �������� ͨ�� [edx] ���Ժ����ʱ���ݽ����������桢�޸Ļ��ȡ����
    //       ������������ʹ��EAX

    //��ѧ����
    Procedure F_Add();
    Procedure F_Sub();
    Procedure F_Mul();
    Procedure F_Div();
    Procedure F_DivE();
    Procedure F_Mod();
    Procedure F_Power();
    Procedure F_IntPower();
    Procedure F_Max();
    Procedure F_Min();
    Procedure F_Bracket(); { ()���� }
    Procedure F_Rev();
    Procedure F_Sqr();
    Procedure F_Sqr3();
    Procedure F_Sqr4();
    Procedure F_Sqrt();
    Procedure F_Sin();
    Procedure F_Cos();
    Procedure F_Tan();
    Procedure F_ArcSin();
    Procedure F_ArcCos();
    Procedure F_ArcTan();
    Procedure F_ArcTan2();
    Procedure F_Ln();
    Procedure F_Log();
    Procedure F_Log2();
    Procedure F_Abs();
    Procedure F_SqrAdd();
    Procedure F_Floor();
    Procedure F_Trunc();
    Procedure F_Round();
    Procedure F_Ceil();
    Procedure F_Sgn();
    Procedure F_exp();
    Procedure F_SinH();
    Procedure F_CosH();
    Procedure F_TanH();
    Procedure F_ArcSinH();
    Procedure F_ArcCosH();
    Procedure F_ArcTanH();
    procedure F_Rnd();
    procedure F_Ctg();
    procedure F_Sec();
    procedure F_Csc();
    procedure F_CscH();
    procedure F_SecH();
    procedure F_CtgH();
    procedure F_ArcCsc();
    procedure F_ArcSec();
    procedure F_ArcCtg();
    procedure F_ArcCscH();
    procedure F_ArcSecH();
    procedure F_ArcCtgH();
    procedure F_Hypot();


    procedure F_SYS_IF_0();   //IF����0
    procedure F_SYS_IF_1();   //IF����1

    procedure F_SYS_FF_0(const N:integer); //���ֺ���0
    procedure F_SYS_FF_1(const N:integer); //���ֺ���1
    procedure F_SYS_FF_2(const N:integer); //���ֺ���2

    procedure F_SYS_Fld_Value();//����������ֵ   �൱��mov  st,[st]
    procedure F_SYS_Fstp_Value();//�����д���ֵ  �൱��mov  [st],st(1)

    //��������
    //True;  //���� true ��=1
    //False; //���� false ��=0
    procedure FB_AND();   //�߼� ��
    procedure FB_OR();    //�߼� ��
    procedure FB_XOR();   //�߼� ���
    procedure FB_NOT();   //�߼� ��
    //��ϵ����(���ز���ֵ)
    procedure FB_EQ();    //���
    procedure FB_NE();    //������
    procedure FB_LT();    //С��
    procedure FB_GT();    //����
    procedure FB_LE();    //С�ڵ���
    procedure FB_GE();    //���ڵ���



    Procedure FF_Fld_X(const x:TCmxFloat); //����x

    {����״̬�Զ���}

    //�õ�����(����)�б�����ת��
    function  Conversion0(var s:string;var str:string):boolean;

    // �õ��ַ����б�ʶ����λ��(Դ�ַ���,��ʶ��,��ʼλ��);
    function  GetMarkerPos(const str:string;const key:string;const ifirst:integer):integer;
    // myPos=pos
    function  myPos(const str:string;const key:string;const ifirst:integer):integer;

    //��'@'��'&'ȡ����ʶ��(Դ�ַ�������ʼλ�ã����ؽ���λ��)��ʧ�ܷ���0; Marker:=Copy(Str,iFirst,iEnd-iFirst+1);
    procedure GetMarker(const Str:string;const iFirst:integer;var iEnd:integer);

    //ȡ����ʶ��������״̬�Զ���(Դ�ַ�������ʼλ�ã����ؽ���λ��)��ʧ�ܷ���0; Marker:=Copy(Str,iFirst,iEnd-iFirst+1);
    procedure GetMarkerValue0(const Str:string;const iFirst:integer;var iEnd:integer);
    procedure GetMarkerValue1(const Str:string;const iFirst:integer;var iEnd:integer);

    //ȡ������������״̬�Զ���(Դ�ַ�������ʼλ�ã����ؽ���λ��)��ʧ�ܷ���0; FloatValue:=strtofloat(Copy(Str,iFirst,iEnd-iFirst+1));
    procedure GetFloatValue0(const Str:string;const iFirst:integer;var iEnd:integer);
    procedure GetFloatValue1(const Str:string;const iFirst:integer;var iEnd:integer);
    procedure GetFloatValue2(const Str:string;const iFirst:integer;var iEnd:integer);
    procedure GetFloatValue3(const Str:string;const iFirst:integer;var iEnd:integer);
    procedure GetFloatValue4(const Str:string;const iFirst:integer;var iEnd:integer);
    procedure GetFloatValue5(const Str:string;const iFirst:integer;var iEnd:integer);
    procedure GetFloatValue6(const Str:string;const iFirst:integer;var iEnd:integer);

    

  public
    { Public declarations }
    constructor Create();
    destructor  Destroy();Override;
  end;

  {$IFDEF MSWINDOWS}

  TSystemTime = record
          wYear   : Word;
          wMonth  : Word;
          wDayOfWeek  : Word;
          wDay    : Word;
          wHour   : Word;
          wMinute : Word;
          wSecond : Word;
          wMilliSeconds: Word;
          reserved    : array [0..7] of char;
  end;
  function exFloatToStr(const value:extended):String;
  procedure GetSystemTime(var lpSystemTime: TSystemTime); stdcall;
  {$EXTERNALSYM GetSystemTime}

  {$ENDIF}


  //����Ŷ���
  const
        csTCompile_NoError              = 0;    //û�з��ִ���!
        csTCompile_NoKnownError         = 1;    //��֪���Ĵ���!
        csTCompile_NoErrorCode          = 2;    //�Ҳ������������Ӧ�Ĵ�������!
        csTCompile_CompileHexCodeError  = 3;    //����ʱָ���ʮ�����ƴ������!
        csTCompile_HexMod2_EQ_1_Error   = 4;    //����ʱ����ָ��ȴ���!
        csTCompile_PMMarker_Error       = 5;    //����õ���������ʱ��������!
        csTCompile_FMMarker_Error       = 6;    //����õ���������ʱ��������!
        csTCompile_Wording_Error        = 7;    //�﷨��������!
        csTCompile_Bracket_Error        = 8;    //�﷨����,�� ( ) ��!
        csTCompile_Optimize_Error       = 9;    //�����Ż�ʱ��������!
        csTCompile_Define_Error         =10;    //�����������(�򳬳�������)!
        csTCompile_Handwriting_Error    =11;    //������д��ʽ����!
        csTCompile_FFHandwriting_Error  =12;    //���ֺ�����д��ʽ����!
        csTCompile_ReadFloat_Error      =13;    //�����ȡ��������ʱ��������!
        csTCompile_ReadMarker_Error     =14;    //�����ȡ��ʶ��ʱ��������!
        csTCompile_Read_Error           =15;    //�﷨����,�в�ʶ����ַ�!
        csTCompile_Note_Match_Error     =16;    //ע�ͷ��Ų�ƥ��!  { } �� /*  */
        csTCompile_FPList_Error         =17;    //�����б����!
        csTCompile_IFHandwriting_Error  =18;    //If������д��ʽ����!


implementation

  const
    MaxTanhDomain :TCmxFloat = 5678.22249441322; // Ln(MaxExtended)/2
    two2neg32: TCmxFloat = 1.0/4294967295;  // 1/(2^32-1)
    MaxInt:TCmxFloat=2147483647.0;
    Infinity:TCmxFloat=1.0/0.0;

function  TCompile.GetError():string;
begin
  result:=GetErrorGB(ErrorCode);
end;

function  TCompile.GetErrorGB(const xErrorCode:integer):string;     //���ش�������
begin
  case xErrorCode of
    csTCompile_NoError              :result:='';//û�з��ִ���!
    csTCompile_NoKnownError         :result:='��֪���Ĵ���!';
    csTCompile_NoErrorCode          :result:='�Ҳ������������Ӧ�Ĵ�������!';
    csTCompile_CompileHexCodeError  :result:='����ʱָ���ʮ�����ƴ������!';
    csTCompile_HexMod2_EQ_1_Error   :result:='����ʱ����ָ��ȴ���!';
    csTCompile_PMMarker_Error       :result:='����õ���������ʱ��������!';
    csTCompile_FMMarker_Error       :result:='����õ���������ʱ��������!';
    csTCompile_Wording_Error        :result:='�﷨��������!';
    csTCompile_Bracket_Error        :result:='�﷨����,�� ( ) ��!';
    csTCompile_Optimize_Error       :result:='�����Ż�ʱ��������!';
    csTCompile_Define_Error         :result:='�����������(�򳬳�������)!';
    csTCompile_Handwriting_Error    :result:='������д��ʽ����!';
    csTCompile_FFHandwriting_Error  :result:='���ֺ�����д��ʽ����!';
    csTCompile_ReadFloat_Error      :result:='�����ȡ��������ʱ��������!';
    csTCompile_ReadMarker_Error     :result:='�����ȡ��ʶ��ʱ��������!';
    csTCompile_Read_Error           :result:='�﷨����,�в�ʶ����ַ�!';
    csTCompile_Note_Match_Error     :result:='ע�ͷ��Ų�ƥ��!  { } �� /*  */';
    csTCompile_FPList_Error         :result:='�����б����!';
    csTCompile_IfHandwriting_Error  :result:='If������д��ʽ����!';
  else result:=GetErrorGB(csTCompile_NoErrorCode);
  end;
end;

function  TCompile.GetErrorBIG5(const xErrorCode:integer):string;     //���ش�������
begin
  //ע��:����ʹ�õ������ķ���BIG5��,Ҫʹ������ת�������ܲ쿴
  case xErrorCode of
    csTCompile_NoError              :result:='';//�S���o�{���~!
    csTCompile_NoKnownError         :result:='�����D�����~!';
    csTCompile_NoErrorCode          :result:='�䤣����~���ҹ��������~�y�z!';
    csTCompile_CompileHexCodeError  :result:='�sĶ�ɫ��O���Q���i��N�X���~!';
    csTCompile_HexMod2_EQ_1_Error   :result:='�sĶ�ɶǤJ���O���׿��~!';
    csTCompile_PMMarker_Error       :result:='�sĶ�o��ѼƦW�ٮɵo�Ϳ��~!';
    csTCompile_FMMarker_Error       :result:='�sĶ�o���ƦW�ٮɵo�Ϳ��~!';
    csTCompile_Wording_Error        :result:='�y�k�o�Ϳ��~!';
    csTCompile_Bracket_Error        :result:='�y�k���~,�b ( ) �B!';
    csTCompile_Optimize_Error       :result:='�sĶɬ�Ʈɵo�Ϳ��~!';
    csTCompile_Define_Error         :result:='��ƽsĶ���~(�ζW�X�w�q��)!';
    csTCompile_Handwriting_Error    :result:='��ƮѼg�榡���~!';
    csTCompile_FFHandwriting_Error  :result:='�n����ƮѼg�榡���~!';
    csTCompile_ReadFloat_Error      :result:='�sĶŪ���`�ƼƦr�ɵo�Ϳ��~!';
    csTCompile_ReadMarker_Error     :result:='�sĶŪ�����ѲŮɵo�Ϳ��~!';
    csTCompile_Read_Error           :result:='�y�k���~,�����ѧO���r��!';
    csTCompile_Note_Match_Error     :result:='�`���Ÿ����ǰt!  { } �� /*  */';
    csTCompile_FPList_Error         :result:='�ѼƦC����~!';
    csTCompile_IfHandwriting_Error  :result:='If��ƮѼg�榡���~!';
  else result:=GetErrorBIG5(csTCompile_NoErrorCode);
  end;
end;

function  TCompile.GetErrorEnglish(const xErrorCode:integer):string;     //���ش�������
begin
  //ע��:������ʹ�ù�����������,ϣ�����д�Ϻ����:)
  case xErrorCode of
    csTCompile_NoError              :result:='';//Not found error!
    csTCompile_NoKnownError         :result:='Not knowing error.';
    csTCompile_NoErrorCode          :result:='Can not find the error code opposite describe.';
    csTCompile_CompileHexCodeError  :result:='The CPU instruction''s HEX code error, when compile the text.';
    csTCompile_HexMod2_EQ_1_Error   :result:='Stream into the instruction length is error, when compile the text.';
    csTCompile_PMMarker_Error       :result:='Find a error when do compile to get the parameters''s name.';
    csTCompile_FMMarker_Error       :result:='Find a error when do compile to get the functions''s name.';
    csTCompile_Wording_Error        :result:='Wording error!';
    csTCompile_Bracket_Error        :result:='Wording error for the "( )" .';
    csTCompile_Optimize_Error       :result:='Find a error when do the compile optimize.';
    csTCompile_Define_Error         :result:='Get the error when compile then function, or overstep the define extent.';
    csTCompile_Handwriting_Error    :result:='The Function''s writeing format error.';
    csTCompile_FFHandwriting_Error  :result:='The integral function''s writeing format error.';
    csTCompile_ReadFloat_Error      :result:='Find a error when do compile to get the constant''s character.';
    csTCompile_ReadMarker_Error     :result:='Find a error when do compile to get the marking''s character.';
    csTCompile_Read_Error           :result:='Wording error,have characters did not define.';
    csTCompile_Note_Match_Error     :result:='Note match error!  { } or /*  */';
    csTCompile_FPList_Error         :result:='Function parameter List Error.';
    csTCompile_IfHandwriting_Error  :result:='The ''If'' function''s writeing format error.';
  else result:=GetErrorEnglish(csTCompile_NoErrorCode);
  end;
end;

function  TCompile.GetErrorCode():integer;
begin
  result:=ErrorCode;
end;

constructor TCompile.Create();
begin
  inherited Create();
  //Enabled:=true;
  FEnabledNote:=true;
  FEnabledOptimizeDiv:=true;
  FEnabledOptimizeStack:=true;
  EnabledOptimizeConst:=true;
  GetFunctionList();
  RndSeed[0]:=0;//���������ʼ����ֵ
  RndSeed[1]:=0; //��֤ @RndSeed[0] �Ժ��4�ֽڵ�Ԫ��Ϊ�� ʹָ�� FILD  qword ptr [E?X] �ܰ�Ҫ��ִ��
end;

destructor TCompile.Destroy;
begin
  inherited Destroy;
end;

function  TCompile.SetText(const Value:string;const ParameterList : string='';const IfCompile:boolean=true):boolean;
  function IsEmpty(const Value:string):boolean;
  var
    i : integer;
  begin
    for i:=1 to length(Value) do
    begin
      if not (Value[i] in [#0,#13,#10,' ',' ','#']) then
      begin
        result:=false;
        exit;
      end;
    end;
    result:=true;
  end;
var
  i : integer;
begin
  //if not Enabled then
 // begin
 //   result:=true;
 //   exit;
 // end;
  try
    //application.MessageBox(pchar(inttostr(length(value))),'!');
    result:=false;
    Clear();
    if not SetFunctionCallFormart(ParameterList) then
    begin
      self.ErrorCode:=0;
      exit;
    end;

    if not IsEmpty(Value) then
    begin
      FExeText:=Value;
      for i:=1 to length(FExeText) do
      begin
        if (FExeText[i]='[') then
          FExeText[i]:='('
        else if (FExeText[i]=']') then
          FExeText[i]:=')';
      end;
    end
    else
      FExeText:='0.0';
    if IfCompile then
    begin
      if not Compile() then exit;
    end;
    result:=true;
  except
    result:=false;
  end;
end;

function  TCompile.GetText():string; //��õ�ǰ������ַ���
begin
  result:=FExeText;
end;


class function TCompile.GetVersion: double;
begin
  result:=csTCompile_Version;
end;

procedure  TCompile.SetFunctionParameter(const PList: array of TCmxFloat); register;assembler
asm

    push    edi

        mov     edi,[eax+ParameterList]
        mov     ecx,[eax+FFunctionPlistCount]
        lea     eax,[edi+TParameterList.CAddress]
        test    ecx,ecx
        jz      @Endfor
      @StartFor:

        {$ifdef FloatType_Extended}
        fld  tbyte ptr  [edx]
        {$else}
          {$ifdef FloatType_Single}
          fld  dword ptr  [edx]
          {$else}
          fld  qword ptr  [edx]
          {$endif}
        {$endif}

        mov     edi,[eax]
        add     edx,SYS_ArrayOneLength //  PList++
        {$ifdef FloatType_Extended}
        fstp tbyte  [edi]
        {$else}
          {$ifdef FloatType_Single}
          fstp dword  [edi]
          {$else}
          fstp qword  [edi]
          {$endif}
        {$endif}
        add     eax,SizeofTParameterList

        dec     ecx
        jnz     @StartFor
      @endFor:

    pop   edi
//}
end;

function TCompile.GetFunctionValue(const PList: array of TCmxFloat): TCmxFloat; register;assembler
{
var
  i  : integer;
begin
  for i:=0 to FFunctionPlistCount-1 do
  begin
    self.ParameterList[i].CAddress^:=PList[i];
  end;
  result:=self.GetValue();
  //}

asm
//  eax   Self
//  edx   PList

    push    eax
    push    edi

        mov     edi,[eax+ParameterList]
        mov     ecx,[eax+FFunctionPlistCount]
        lea     eax,[edi+TParameterList.CAddress]
        test    ecx,ecx
        jz      @Endfor
      @StartFor:

        {$ifdef FloatType_Extended}
        fld  tbyte ptr  [edx]
        {$else}
          {$ifdef FloatType_Single}
          fld  dword ptr  [edx]
          {$else}
          fld  qword ptr  [edx]
          {$endif}
        {$endif}

        mov     edi,[eax]
        add     edx,SYS_ArrayOneLength //  PList++
        {$ifdef FloatType_Extended}
        fstp tbyte  [edi]
        {$else}
          {$ifdef FloatType_Single}
          fstp dword  [edi]
          {$else}
          fstp qword  [edi]
          {$endif}
        {$endif}
        add     eax,SizeofTParameterList

        dec     ecx
        jnz     @StartFor
      @endFor:

    pop   edi
    pop   eax

    call dword ptr  [eax+GetValue]

//}
end;
//*)

function TCompile.SetFunctionCallFormart( const ParameterList: string): boolean;
var
  P,iEnd: integer;
  L     : integer;
  Str   : string;
  PName : string;
  sign  : integer;
begin
    L:=0;
    P:=0;
    sign:=0;  // ״̬����ʼ״̬
    while true do
    begin
      case  sign of
        -1: begin   // �����˳�״̬
              FFunctionPlistIsSet:=false;
              FFunctionPlistCount:=0;
              result:=false;
              PParameterList:=0; //������ջ���
              exit;
            end;
        10: begin   // �ɹ��˳�״̬
              FFunctionPlistIsSet:=true;
              result:=true;
              exit;
            end;
        0 : begin   // ��ʼ״̬
              str:=uppercase(ParameterList);
              L:=length(ParameterList);
              FFunctionPlistCount:=0;
              P:=0;
              PParameterList:=0;
              if L=0 then
              begin
                sign:=10;
              end
              else
              begin
                sign:=1;
                P:=1;
              end;
            end;
        1:  begin   // �տ�ʼȡ����ǰ��ȡ��','�� ��״̬
              if P=L+1 then
                sign:=10
              else if str[p] in [' ',#13,#10,#9] then
              begin
                sign:=1;
                inc(P);
              end
              else if (str[p] in ['A'..'Z','_']) then
              begin
                sign:=2;
              end
              else
              begin
                sign:=-1;
              end;
            end;
        2:  begin  //ȡ��������״̬
              self.GetMarkerValue0(str,P,iEnd);
              if iEnd=0 then
                sign:=-1
              else
              begin
                inc(FFunctionPlistCount);
                PName:=copy(str,P,iEnd-P+1);
                self.ParameterListIn(PName);
                p:=iEnd+1;
                sign:=3;
              end;
            end;
        3:  begin  //ȡ��������ƺ�״̬
              if P=L+1 then
                sign:=10
              else if str[p] in [' ',#13,#10,#9] then
              begin
                sign:=3;
                inc(P);
              end
              else if str[p]=',' then
              begin
                sign:=1;
                inc(P);
              end;
            end;
      end;//case
    end;  //while

end;


function  TCompile.SetParameter(const PName:string;const dValue:TCmxFloat):boolean;
var
  i     :integer;
  sKey  :string;
begin
  //if not Enabled then
  //begin
  //  result:=true;
 //   exit;
  //end;
  try
    result:=false;
    sKey:=uppercase(PName);
    if sKey[1]<>'&' then sKey:='&'+sKey;
    for i:=0 to PParameterList-1 do
    begin
      if uppercase(ParameterList[i].CName)=sKey then
      begin
         ParameterList[i].CAddress^:=dValue;
         result:=true;
         exit;
      end;
    end;
  except
    result:=false;
  end;
end;

function  TCompile.SetExteriorArrayParameter(const ArrayPName:string;const ArrayPAddress:PTCmxFloat):boolean;
var
  Add :string;
begin
  try
    Add:='TCmSYS_ArrayAddress_'+ArrayPName;
    //todo:Test it!!!
    //result:=self.Define(ArrayPName+'(Index)','TCmSYS_Fld_Value(Round(Index)*'+inttoHex(SYS_ArrayOneLength,2)+'+'+Add+')');
    result:=self.Define(ArrayPName+'(Index)','TCmSYS_Fld_Value( (Index)*'+inttoStr(SYS_ArrayOneLength)+'+'+Add+')');
    if not result then exit;
    result:=self.DefineConst(Add,inttostr(Cardinal(ArrayPAddress)));
  except
    result:=false;
  end;
end;



function  TCompile.SetExteriorParameter(const PNameList:array of string;const PAddressList:array of PTCmxFloat):boolean;
var
  i  : integer;
begin
  try
    for i:=low(PNameList) to high(PNameList) do
    begin
      if not SetExteriorParameter(PNameList[i],PAddressList[i]) then
      begin
        result:=false;
        exit;
      end;
    end;
    result:=true;
  except
    result:=false;
  end;
end;


function  TCompile.SetExteriorParameter(const PName:string;const PAddress:PTCmxFloat):boolean;
var
  i     :integer;
  sKey  :string;
begin
  try
    sKey:=uppercase(PName);
    if sKey[1]<>'&' then sKey:='&'+sKey;
    for i:=0 to PParameterList-1 do
    begin
      if uppercase(ParameterList[i].CName)=sKey then
      begin
         ParameterList[i].CAddress:=PAddress;
         ParameterList[i].IsExterior:=true;
         ParameterList[i].IsConst:=false;
         result:=true;
         exit;
      end;
    end;

    //  û���ҵ������½�һ������
    i:=self.ParameterListIn(PName);
    if i>=0 then
    begin
      ParameterList[i].CAddress:=PAddress;
      ParameterList[i].IsExterior:=true;
      ParameterList[i].IsConst:=false;
      result:=true;
      exit;
    end;

    result:=false;
  except
    result:=false;
  end;
end;

procedure  TCompile.SetParameter(const PAddress:PTCmxFloat;const dValue:TCmxFloat);
begin
  //if not Enabled then exit;
  PAddress^:=dValue;
end;

function  TCompile.GetParameterAddress(const PName:string):PTCmxFloat;
var
  i     :integer;
  sKey  :string;
begin
  try
    result:=PTCmxFloat(0);
    sKey:=uppercase(PName);
    if sKey[1]<>'&' then sKey:='&'+sKey;
    for i:=0 to PParameterList-1 do
    begin
      if uppercase(ParameterList[i].CName)=sKey then
      begin
         result:=ParameterList[i].CAddress;
         exit;
      end;
    end;
  except
    result:=PTCmxFloat(0);
  end;
end;

function  TCompile.GetParameterIndex(const PName:string):integer; //�õ��������
var
  i     :integer;
  sKey  :string;
begin
  try
    result:=-1;
    sKey:=uppercase(PName);
    if sKey[1]<>'&' then sKey:='&'+sKey;
    for i:=0 to PParameterList-1 do
    begin
      if uppercase(ParameterList[i].CName)=sKey then
      begin
         result:=i;//ParameterList[i].CIndex;
         exit;
      end;
    end;
  except
    result:=-1;
  end;
end;

procedure TCompile.Clear();
begin
  ErrorCode:=0;
  CompileInPFirst:=0;
  FFunctionPlistCount:=0;
  TF00:='';
  T_SYS_FF_ConstN:=0;

  PExeAddressCode:=0;   //(�����Ժ��ִ����) ��ʼ��
  setlength(ExeAddressCode,1024);

  PParameterList:=0;    //(�����б�) ��ʼ��
  setlength(ParameterList,1024);

  PExeParameter:=0;        //(����� ��������ռ�) ��ʼ��
  setlength(ExeParameter,1024);

  PExeAddressList:=0;      //(��¼ָ��λ���б� ����) ��ʼ��
  setlength(ExeAddressList,1024);

  PExeAddressPMList:=0;    //(��¼ָ��λ���б� �����洢��ַ) ��ʼ��
  setlength(ExeAddressPMList,1024);

  PFunctionStack := 0 ;        //(�������ŵ��ö�ջ) ��ʼ��
  setlength(FunctionStack,1024);

  T_PTrueNow.isConst:=false;   //(�����Ż�����ʱ  �������ʶ�ջ) ��ʼ��
  T_PTrueOld.isConst:=false;
  PT_PTrueNowList:=0;
  setlength(T_PTrueNowList,1024);

end;

procedure TCompile.ExeAddressCodeIn(const B:Byte);
begin
  if PExeAddressCode>=high(ExeAddressCode)-1 then
  begin
    setlength(ExeAddressCode,2*high(ExeAddressCode)+2);
  end;
  ExeAddressCode[PExeAddressCode]:=B;
  inc(PExeAddressCode);
end;

procedure TCompile.ExeAddressCodeIn(const B:array of Byte);
var
  i   :integer;
begin
  for i:=low(b) to high(b) do
  begin
     ExeAddressCodeIn(b[i]);
  end;
end;

var
  HEXToINT: array[0..255] of integer;//��ѯ��
//���� HEXToINT: array[0..255] of integer ��ѯ��
procedure SetHEXToINTValue();
var
  i    : integer;
begin
  for i:=0 to 255 do
    HEXToINT[i]:=0;
  for i:=byte('0') to byte('9') do
    HEXToINT[i]:=i-byte('0');
  for i:=byte('A') to byte('F') do
    HEXToINT[i]:=i-byte('A')+10;
  for i:=byte('a') to byte('f') do
    HEXToINT[i]:=i-byte('a')+10;
end;

procedure TCompile.ExeAddressCodeIn(const sB:string);
var
  i   :integer;
  b   :byte;
  {function hextoint(const cB:char):byte;
  begin
    case upcase(cB) of
      '0'..'9':
        result:=strtoint(cB);
      'A':
        result:=10;
      'B':
        result:=11;
      'C':
        result:=12;
      'D':
        result:=13;
      'E':
        result:=14;
      'F':
        result:=15;
      else
        begin
          //application.MessageBox('Compile Error!','Error:');
          ErrorCode:=csTCompile_CompileHexCodeError;
          result:=0;
        end;
    end; 
  end; }
begin
  if length(sb) Mod 2=1 then  //application.MessageBox('Compile Error!','Error:');
      ErrorCode:=csTCompile_HexMod2_EQ_1_Error;
  for i:=1 to length(sB) Div 2 do
  begin
    b:=hextoint[byte(sb[i*2-1])] shl 4 or hextoint[byte(sb[i*2])];
    ExeAddressCodeIn(b);
  end;
end;

procedure  TCompile.GetExeAddressCodeInPointerRePm(const PName:string);
begin
  if PExeAddressPMList>=high(ExeAddressPMList)-1 then
  begin
    setlength(ExeAddressPMList,2*high(ExeAddressPMList)+2);
  end;
  ExeAddressPMList[PExeAddressPMList].ExeIndex:=PExeAddressCode;
  ExeAddressPMList[PExeAddressPMList].PName:=PName;
  inc(PExeAddressPMList);
end;

Function  TCompile.GetExeAddressCodeInPointerReCode():Pointer;
begin
  if PExeAddressList>=high(ExeAddressList)-1 then
  begin
    setlength(ExeAddressList,2*high(ExeAddressList)+2);
  end;
  result:=@ExeAddressCode[PExeAddressCode];
  ExeAddressList[PExeAddressList]:=PExeAddressCode;
  inc(PExeAddressList);
end;

procedure TCompile.RefreshExeAddressCodeInPointer();
var
  i     :integer;
  pExe  :pointer;
  iExe  :integer;
  j     :Cardinal;
  pM    :pointer;
  index :integer;

begin
  for i:=0 to PExeAddressList-1 do
  begin

    pExe:=@ExeAddressCode[ExeAddressList[i]];
    iExe:=Cardinal(PExe)+5;
    ExeAddressCode[ExeAddressList[i]]:=$B8;     //mov eax
    ExeAddressCode[ExeAddressList[i]+1]:=(byte(iExe Mod 256));
    ExeAddressCode[ExeAddressList[i]+2]:=(byte((iExe Div 256) Mod 256));
    ExeAddressCode[ExeAddressList[i]+3]:=(byte((iExe Div (256*256)) Mod 256));
    ExeAddressCode[ExeAddressList[i]+4]:=(byte((iExe Div (256*256*256)) Mod 256)); //  mov   eax,iExe   //return Address

  end;
  for i:=0 to PExeAddressPMList-1 do
  begin
    index:=self.GetParameterIndex(ExeAddressPMList[i].PName);

    if not ParameterList[index].IsExterior then  //�ڲ�����
       pExe:=@ExeParameter[ParameterList[index].CIndex]
    else
       pExe:=ParameterList[index].CAddress;
       
    iExe:=Cardinal(pExe);

    ExeAddressCode[ExeAddressPMList[i].ExeIndex]:=(byte(iExe Mod 256));
    ExeAddressCode[ExeAddressPMList[i].ExeIndex+1]:=(byte((iExe Div 256) Mod 256));
    ExeAddressCode[ExeAddressPMList[i].ExeIndex+2]:=(byte((iExe Div (256*256)) Mod 256));
    ExeAddressCode[ExeAddressPMList[i].ExeIndex+3]:=(byte((iExe Div (256*256*256)) Mod 256));//return Address

  end;


  //ˢ���������ݵ�ַ
  //mov  ecx,@ExeAddressStack[0]
  pM:=@ExeAddressStack[0];
  j:=Cardinal(pM);
  ExeAddressCode[1]:=byte(j Mod 256);
  ExeAddressCode[2]:=byte((j Div 256) Mod 256);
  ExeAddressCode[3]:=byte((j Div (256*256)) Mod 256);
  ExeAddressCode[4]:=byte((j Div (256*256*256)) Mod 256);
  //mov  edx,@ExeAddressTempData[0]
  pM:=@ExeAddressTempData[0];
  j:=Cardinal(pM);
  ExeAddressCode[6]:=byte(j Mod 256);
  ExeAddressCode[7]:=byte((j Div 256) Mod 256);
  ExeAddressCode[8]:=byte((j Div (256*256)) Mod 256);
  ExeAddressCode[9]:=byte((j Div (256*256*256)) Mod 256);
  
end;

function TCompile.OptimizeStackCall(const IfFxch:boolean=true):boolean;    // �Ż���ջ����
const
  StackCallOLD: array [0..11] of byte=(
      {$ifdef FloatType_Extended}
      $DB,$39,                // fstp   tbyte ptr  [ecx]
      {$else}
        {$ifdef FloatType_Single}
        $D9,$19,                // fstp   dword ptr  [ecx]
        {$else}
        $DD,$19,                // fstp   dword ptr  [ecx]
        {$endif}
      {$endif}
      $83,$C1,SYS_EFLength,          // add    ecx,SYS_EFLength
      $B8,$00,$00,$00,$00,  // mov    eax,$00000000
      {$ifdef FloatType_Extended}
      $DB,$28                 // fld    tbyte ptr  [eax]
      {$else}
        {$ifdef FloatType_Single}
        $D9,$00                 // fld    dword ptr  [eax]
        {$else}
        $DD,$00                 // fld    qword ptr  [eax]
        {$endif}
      {$endif}
      );
  StackCallNEW: array [0..8] of byte=(
      $B8,$00,$00,$00,$00,  // mov    eax,$00000000
      {$ifdef FloatType_Extended}
      $DB,$28,                 // fld    tbyte ptr  [eax]
      {$else}
        {$ifdef FloatType_Single}
        $D9,$00,                 // fld    dword ptr  [eax]
        {$else}
        $DD,$00,                 // fld    qword ptr  [eax]
        {$endif}
      {$endif}
      $D9,$C9               // fxch   st(1)
      );
  // ��Щ���뵱ѹջ��ջ�����仯ʱ��Ҫ����
  // CompileInP
var
  i,L   : integer;
  k     : integer;
begin
  result:=false;
  if not EnabledOptimizeStack then exit;

  L:=PExeAddressCode-1;
  if L<11 then exit;

  k:=0;
  for i:=L-11 to L do
  begin
    if StackCallOLD[k]<>ExeAddressCode[i]  then exit;
    inc(k);
  end;

  // ����Ҫ������Ż�
  k:=0;
  for i:=L-11 to L-3 do
  begin
    ExeAddressCode[i]:=StackCallNEW[k];
    inc(k);
  end;
  if IfFxch then
    dec(PExeAddressCode,3)   // ����λ�û���3�ֽ�
  else
    dec(PExeAddressCode,5);  // ����λ�û���5�ֽ�
  dec(ExeAddressPMList[PExeAddressPMList-1].ExeIndex,5); // ��������λ�û���5�ֽ�
  result:=true;
end;


Function  TCompile.GetExeCodeLength():integer;
begin
  result:=PExeAddressCode;
end;

Function  TCompile.GetExeParameterLength():integer;
begin
  result:=PParameterList*SYS_EFLength;
end;

procedure TCompile.SetRandomize(const RandomSeed :integer);
begin
  RndSeed[0]:=RandomSeed;
end;

{$IFDEF MSWINDOWS}
procedure GetSystemTime; external 'kernel32.dll' name 'GetSystemTime'; 
{$ENDIF}

{$IFDEF MSWINDOWS}
procedure TCompile.SetRandomize();
var
        systemTime : TSystemTime;
begin
  GetSystemTime(systemTime);
  RndSeed[0]:=((systemTime.wHour*60+systemTime.wMinute)*60+systemTime.wSecond)*1000+systemTime.wMilliSeconds;
end;
{$ENDIF}

{$IFDEF LINUX }
procedure TCompile.SetRandomize();
begin
  RndSeed[0]:=Trunc(24.0*3600.0*1000*double(Time));
end;
{$ENDIF}

///---------

function TCompile.GetSign(var str:string):string;//���� str �ĵ�һ��������
var
  T1    : char;
  i1,i2 :integer;
  TName :string;
begin
  // TF00 ����������һ�εķ���
  try
    result:='';
    T1 := str[1];
    Case T1 of
      '&':
      begin
        i1:=2;
        i2:=0;
        GetMarker(str,i1,i2);
        if i2<>0 then
        begin
          TName:=copy(str,1,i2);
          CompileInP(TName);    //���� ������ջ�������
          str:=copy(str,i2+1,Length(str)-i2) ; //ȥ��ǰ������ݶ�
          CheckWording(Tf00, TName) ;   // �����Ⱥ��ϵ����﷨����
          TF00 := TName ;
          result := GetSign(str);  //**�ݹ����**
          Exit;
        end
        else
        begin
          ErrorCode:= csTCompile_PMMarker_Error;
          result:='';
        end;
      end;
      '@':
      begin      
        i1:=2;
        i2:=0;
        GetMarker(str,i1,i2);
        if i2<>0 then
        begin
          TName:=copy(str,1,i2);
          result :=TName;
          str:=copy(str,i2+1,Length(str)-i2) ;
          CheckWording(Tf00, TName);    // �����Ⱥ��ϵ����﷨����
          TF00 := TName;
          Exit;
        end
        else
        begin
          ErrorCode :=csTCompile_FMMarker_Error;
          result:='';
        end;
      end ;
      '#':
      begin
        result:='@#';
        CheckWording(Tf00,'@#');  
        Tf00 :='@#';
        Exit;
      end;
    End;
except
  If ErrorCode= 0 Then
    ErrorCode := csTCompile_NoKnownError;
  result:='';
end;

end;

//�ȽϷ��ŵ����ȼ�
//
//     '1'       �ӷ���ջ����һ��������f,����f��ֵ��
//
//     '-1'      �ѵ�ǰ������ѹ�����ջ,������һ����������
//
//     '0'       ��ǰ����Ϊ'#'ʱ,��־������ɡ�
//               ��ǰ����Ϊ')'ʱ,�ӷ���ջ����һ��������f,����f,������һ����������
//
//     '-2'      ����
//
function TCompile.CompareSign(const FName1 : string; const FName2 :string): integer;
var
  sF1,sF2   :string;
  function FIn(const F:string;const Af:array of string):boolean;
  var
    i   :integer;
  begin
    result:=false;
    for i:=Low(Af) to High(Af) do
    begin
      if uppercase(F)=uppercase(Af[i]) then
      begin
        result:=true;
        exit;
      end;
    end;
  end;
begin
  sF1:=uppercase(FName1);
  sF2:=uppercase(FName2);
  if (sF1<>'') and (sF1[1]<>'@') then sF1:=sF1+'@';
  if (sF2<>'') and (sF2[1]<>'@') then sF2:=sF1+'@';
  if (ifSYS_ff(sF1)) then sF1:=getSYS_ff(sF1);
  if (ifSYS_ff(sF2)) then sF2:=getSYS_ff(sF2);

  if Fin(sF1,['@TCmSYS_BooleanEQ','@TCmSYS_BooleanNE','@TCmSYS_BooleanLT','@TCmSYS_BooleanGT','@TCmSYS_BooleanLE','@TCmSYS_BooleanGE']) then
  begin
    if Fin(sF2,['@)','@#']) then
      result := 1
    Else
      result := -1;
  end
 { else if Fin(sF1,['@AND','@OR','@XOR']) then
  begin
    if Fin(sF2,['@AND','@OR','@XOR','@)','@#']) then
      result := 1
    Else
      result := -1;
  end}
  else if Fin(sF1,['@Add','@Sub','@TCmSYS_FF_0','@TCmSYS_FF_1','@TCmSYS_FF_2']) then
  begin
    if Fin(sF2,['@TCmSYS_BooleanEQ','@TCmSYS_BooleanNE','@TCmSYS_BooleanLT','@TCmSYS_BooleanGT','@TCmSYS_BooleanLE','@TCmSYS_BooleanGE',
                '@Add','@Sub','@)','@#','@TCmSYS_FF_0','@TCmSYS_FF_1','@TCmSYS_FF_2']) then
      result := 1
    Else
      result := -1;
  end
  else if  Fin(sF1, ['@Mul','@Div','@DivE','@Mod','@Max','@Hypot','@TCmSYS_Fstp_Value','@TCmSYS_IF_0','@TCmSYS_IF_1','@SqrAdd','@Min','@ArcTan2'] )then
  begin
    if  Fin(sF2,['@TCmSYS_BooleanEQ','@TCmSYS_BooleanNE','@TCmSYS_BooleanLT','@TCmSYS_BooleanGT','@TCmSYS_BooleanLE','@TCmSYS_BooleanGE',
                 '@Add','@Sub','@Mul','@Max','@Hypot','@TCmSYS_Fstp_Value','@TCmSYS_IF_0','@TCmSYS_IF_1','@SqrAdd','@Min','@ArcTan2','@Div','@DivE','@Mod','@)','@#'] )then
      result := 1
    Else
      result := -1;
  end
  else if  Fin(sF1,['@AND','@OR','@XOR','@Power','@IntPower']) then
  begin
    if  Fin(sF2, ['@AND','@OR','@XOR',
                  '@TCmSYS_BooleanEQ','@TCmSYS_BooleanNE','@TCmSYS_BooleanLT','@TCmSYS_BooleanGT','@TCmSYS_BooleanLE','@TCmSYS_BooleanGE',
                  '@Add','@Sub','@Mul','@Div','@DivE','@Mod','@)','@#','@Power','@IntPower','@Max','@Hypot','@TCmSYS_Fstp_Value','@TCmSYS_IF_0','@TCmSYS_IF_1','@SqrAdd','@Min','@ArcTan2'] )then
      result := 1
    Else
      result := -1;
  end
  else if sF1='@)' then
  begin
    result := -2;
  end
  else if sF1='@#' then
  begin
    if sF2='@#' then
      result := 0
    else if sF2='@)' then
      result := -2
    else
      result := -1;
  end
  Else
  begin
    if sF2 ='@)' then
      result := 0
    else if sF2 ='@#' then
      result := -2
    Else
      result := -1
  end;
end;


// �����Ⱥ��ϵ����﷨����
procedure TCompile.CheckWording(const T1 : string;const T2 : string) ;// �����Ⱥ��ϵ����﷨����
var
  sF1,sF2  :string;
  function FIn(const F:string;const Af:array of string):boolean;
  var
    i   :integer;
  begin
    result:=false;
    for i:=Low(Af) to High(Af) do
    begin
      if uppercase(F)=uppercase(Af[i]) then
      begin
        result:=true;
        exit;
      end;
    end;
  end;
begin
  sF1:=uppercase(T1);
  sF2:=uppercase(T2);

  if (ifSYS_ff(sF1)) then sF1:=getSYS_ff(sF1);
  if (ifSYS_ff(sF2)) then sF2:=getSYS_ff(sF2);

  if (sF1<>'') and (sF1[1]='&') then
  begin
    if not (Fin(sF2,['@AND','@OR','@XOR',
                     '@TCmSYS_BooleanEQ','@TCmSYS_BooleanNE','@TCmSYS_BooleanLT','@TCmSYS_BooleanGT','@TCmSYS_BooleanLE','@TCmSYS_BooleanGE',
                     '@Add','@TCmSYS_FF_0','@TCmSYS_FF_1','@TCmSYS_FF_2','@Sub','@Mul','@Max','@Hypot','@TCmSYS_Fstp_Value','@TCmSYS_IF_0','@TCmSYS_IF_1','@SqrAdd','@Min','@ArcTan2','@Div','@DivE','@Mod','@Power','@IntPower','@)','@#'])) then
      ErrorCode:=csTCompile_Wording_Error;
  end
  else if sF1='@)' then
  begin
    if not (Fin(sF2,['@AND','@OR','@XOR',
                     '@TCmSYS_BooleanEQ','@TCmSYS_BooleanNE','@TCmSYS_BooleanLT','@TCmSYS_BooleanGT','@TCmSYS_BooleanLE','@TCmSYS_BooleanGE',
                     '@Add','@TCmSYS_FF_0','@TCmSYS_FF_1','@TCmSYS_FF_2','@Sub','@Mul','@Max','@Hypot','@TCmSYS_Fstp_Value','@TCmSYS_IF_0','@TCmSYS_IF_1','@SqrAdd','@Min','@ArcTan2','@Div','@DivE','@Mod','@Power','@IntPower','@)','@#'])) then
      ErrorCode:=csTCompile_Wording_Error;
  end
  else if Fin(sF1,['@#','']) then
  begin
    if sF2='@)' then
      ErrorCode:=csTCompile_Wording_Error;
  End
  else if Fin(sF1,['@TCmSYS_BooleanEQ','@TCmSYS_BooleanNE','@TCmSYS_BooleanLT','@TCmSYS_BooleanGT','@TCmSYS_BooleanLE','@TCmSYS_BooleanGE',
                   '@Add','@TCmSYS_FF_0','@TCmSYS_FF_1','@TCmSYS_FF_2','@Sub','@Mul','@Max','@Hypot','@TCmSYS_Fstp_Value','@TCmSYS_IF_0','@TCmSYS_IF_1','@SqrAdd','@Min','@ArcTan2','@Div','@DivE','@Mod','@Power','@IntPower']) then
  begin
    if Fin(sF2,['@TCmSYS_BooleanEQ','@TCmSYS_BooleanNE','@TCmSYS_BooleanLT','@TCmSYS_BooleanGT','@TCmSYS_BooleanLE','@TCmSYS_BooleanGE',
                '@Add','@TCmSYS_FF_0','@TCmSYS_FF_1','@TCmSYS_FF_2','@Sub','@Mul','@Max','@Hypot','@TCmSYS_Fstp_Value','@TCmSYS_IF_0','@TCmSYS_IF_1','@SqrAdd','@Min','@ArcTan2','@Div','@DivE','@Mod','@Power','@IntPower','@)','@#']) then
      ErrorCode:=csTCompile_Wording_Error;
  end
  else
  begin
    if Fin(sF2,['@AND','@OR','@XOR', '@Mul','@Max','@Hypot','@TCmSYS_Fstp_Value','@TCmSYS_IF_0','@TCmSYS_IF_1','@SqrAdd','@Min','@ArcTan2','@Div','@DivE','@Mod','@Power','@IntPower','@)','@#']) then
      ErrorCode:=csTCompile_Wording_Error;
  end;
End;

//�������ȼ��Ĵ�����
//
//     '-2'      ����
//
//     '-1'      �ѵ�ǰ������ѹ�����ջ,������һ����������
//
//     '1'       �ӷ���ջ����һ��������f,����f��
//
//     '0'       ��ǰ����Ϊ'#'ʱ,������ɡ�
//               ��ǰ����Ϊ')'ʱ,�ӷ���ջ����һ��������f,����f,������һ����������
//
function TCompile.Compile():boolean;
var
  ok    :integer;
  T1,T2 :string;
  TQ    :string;
  f     :string;
begin
  try
    result:=false;
    PExeAddressCode:=0;

    ExeAddressCodeIn('b900000000');   //mov  ecx,@ExeAddressStack[0]
    ExeAddressCodeIn('ba00000000');   //mov  edx,@ExeAddressTempData[0]
    //ExeAddressCodeIn('53');  //push ebx
    //ExeAddressCodeIn('dbe3');  //fninit ��ʼ��FPU

    TQ:=FExeText;
    if not Parsing(TQ) then exit;
    T2 := GetSign(TQ);
    if ErrorCode>0 then
    begin
      exit;
    end;
    FunctionStackIn('@#');
    ok:=0;
    while ok=0 do
    begin
        If ErrorCode> 0 Then
        begin
          exit;
        end;
        T1 := FunctionStackRead();
        Case CompareSign(T1, T2) of
            -2:
                ErrorCode :=csTCompile_Bracket_Error;
            -1:
              begin
                FunctionStackIn(T2);
                T2 := GetSign(TQ);
              end;
            1:
              begin
                f := FunctionStackOut();
                CompileInF(f) ;   //���� ��������
              end;
            0 :
              begin
                If FunctionStackRead()='@#' Then
                begin
                     ok:=1;
                end
                else
                begin
                    f := FunctionStackOut() ;
                    CompileInF(f);   //���� ��������
                    T2 := GetSign(TQ);
                end;
              end;
        End;
    end;

    //ExeAddressCodeIn('5b');  //pop  ebx
    ExeAddressCodeIn('C3');  //ret

    RefreshExeAddressCodeInPointer();
    self.GetValue:=@ExeAddressCode[0];

    if self.ErrorCode<>0 then
      result:=false
    else
      result:=true;
  except
    result:=false;
  end;
end;

procedure TCompile.CompileInP(const PName :string); //���� ���������ջ
var
 // P   :PTCmxFloat;
 // i   :Cardinal; {unsigned 32}
  index :integer;

begin           //++7 or ++12

  if (CompileInPFirst=0) then
  begin
    CompileInPFirst:=1;
  end
  else
  begin
    inc(CompileInPFirst);
    {$ifdef FloatType_Extended}
    ExeAddressCodeIn('DB39');                           //fstp  tbyte ptr  [ecx]
    {$else}
      {$ifdef FloatType_Single}
      ExeAddressCodeIn('D919');                         //fstp  dword ptr  [ecx]
      {$else}
      ExeAddressCodeIn('DD19');                         //fstp  qword ptr  [ecx]
      {$endif}
    {$endif}
    ExeAddressCodeIn('83c1'+inttoHex(SYS_EFLength,2));  //inc ecx,SYS_EFLength
  end;

 // p:=getParameterAddress(PName);
 // i:=Cardinal(p);
  ExeAddressCodeIn('B8');  //mov eax
  GetExeAddressCodeInPointerRePm(PName);
  ExeAddressCodeIn('00000000');

  {$ifdef FloatType_Extended}
  ExeAddressCodeIn('db28');  //fld  tbyte ptr [eax] ,  [eax] -> st
  {$else}
    {$ifdef FloatType_Single}
    ExeAddressCodeIn('D900');  //fld  dword ptr [eax] ,  [eax] -> st
    {$else}
    ExeAddressCodeIn('DD00');  //fld  qword ptr [eax] ,  [eax] -> st
    {$endif}
  {$endif}

  index:=GetParameterListConstIndex(PName);
  if index>=0 then
  begin
    T_PTrueNowListIn(T_PTrueOld);
    T_PTrueOld:=T_PTrueNow;
    T_PTrueNow.isConst:=true;
    T_PTrueNow.dValue:=ParameterList[index].CAddress^;
  end
  else
  begin                 
    T_PTrueNowListIn(T_PTrueOld);
    T_PTrueOld:=T_PTrueNow;
    T_PTrueNow.isConst:=false;
  end;
end;
procedure TCompile.CompileInPReNew(const dValue:TCmxFloat;const Pm:integer); //���� ������ջ������� (�滻)
begin
  if pm=1 then
  begin
    if CompileInPFirst=1 then          
      dec(PExeAddressCode,7)          // CompileInP()���� ���ɵĴ��볤��Ϊ 7 Byte
    else
      dec(PExeAddressCode,12);         // CompileInP()���� ���ɵĴ��볤��Ϊ 12 Byte
    Dec(PExeAddressPMList);
    dec(CompileInPFirst);
  end
  else //if pm=2 then
  begin
    if CompileInPFirst=2 then
      dec(PExeAddressCode,7+12)
    else
      dec(PExeAddressCode,12+12);
    Dec(PExeAddressPMList,2);
    dec(CompileInPFirst,2);
  end;

  
  if (CompileInPFirst=0) then
  begin
    CompileInPFirst:=1;
  end
  else
  begin
    inc(CompileInPFirst);
    {$ifdef FloatType_Extended}
    ExeAddressCodeIn('DB39');                           //fstp  tbyte ptr  [ecx]
    {$else}
      {$ifdef FloatType_Single}
      ExeAddressCodeIn('D919');                         //fstp  dword ptr  [ecx]
      {$else}
      ExeAddressCodeIn('DD19');                         //fstp  qword ptr  [ecx]
      {$endif}
    {$endif}
    ExeAddressCodeIn('83c1'+inttoHex(SYS_EFLength,2));  //inc ecx,SYS_EFLength
  end;

  FF_Fld_X(dValue);

  if pm=1 then
  begin
    T_PTrueNow.isConst:=true;
    T_PTrueNow.dValue:=dValue;
  end
  else //if pm=2 then
  begin
    T_PTrueOld:=T_PTrueNowListOut();
    T_PTrueNow.isConst:=true;
    T_PTrueNow.dValue:=dValue;
  end;
  
end;
procedure TCompile.CompileOutP(); //���� ��������
begin
  ExeAddressCodeIn('83e9'+inttoHex(SYS_EFLength,2));  //dec ecx ��SYS_EFLength
  {$ifdef FloatType_Extended}
  ExeAddressCodeIn('db29');  //fld  tbyte ptr [ecx]
  {$else}
    {$ifdef FloatType_Single}
    ExeAddressCodeIn('D901');  //fld  dword ptr [ecx]
    {$else}
    ExeAddressCodeIn('DD01');  //fld  qword ptr [ecx]
    {$endif}
  {$endif}
end;

procedure TCompile.CompileInF(const FName:string); //���� ��������
var
  sName          :string;
  ConstdValue    :TCmxFloat;
  CCost2         :boolean;
  CCost1         :boolean;
 // CConstDiv      :boolean;
//  CCost0         :boolean;
  ff_N           :integer;
  xTemp           :TCmxFloat;
//  sTemp          :string;
//label
//  CompileFunction;

begin

  try
    sName:=uppercase(FName);
    if (sName<>'') and (sName[1]<>'@') then sName:='@'+sName;
    ConstdValue:=0;

    if (FEnabledOptimizeDiv) and    //�Ż� ����Div
       (T_PTrueNow.isConst) and (not T_PTrueOld.isConst) and (sName=('@DIV')) then
    begin
      sName:='@MUL';
      if T_PTrueNow.dValue<>0 then
        T_PTrueNow.dValue:=1.0/T_PTrueNow.dValue
      else
        T_PTrueNow.dValue:=Infinity;

      dec(PExeAddressCode,7);  // CompileInP()���� ������� ���ɵĴ��볤���������Ϊ 7 Byte
      dec(self.PExeAddressPMList);
      FF_FLD_x(T_PTrueNow.dValue); // FF_FLD_x()���� ���ɵĴ��볤��ҲΪ 7 Byte
    end;

    if FEnabledOptimizeConst then    // �Ż���������
    begin

      if T_PTrueNow.isConst  then
      begin
      //�Գ�������ʱ�����Ż�
        CCost2:=false;
        if T_PTrueOld.isConst  then    // ��Ԫ����
        begin
          CCost2:=true;
          if sName=uppercase('@AND') then
          begin
            if (T_PTrueOld.dValue<>0) and (T_PTrueNow.dValue<>0) then
              ConstdValue:=1.0
            else
              ConstdValue:=0;
          end
          else if sName=uppercase('@OR') then
          begin
            if (T_PTrueOld.dValue<>0) or (T_PTrueNow.dValue<>0) then
              ConstdValue:=1.0
            else
              ConstdValue:=0;
          end
          else if sName=uppercase('@XOR') then
          begin
            if ((T_PTrueOld.dValue<>0) and (T_PTrueNow.dValue=0))
            or ((T_PTrueOld.dValue=0) and (T_PTrueNow.dValue<>0)) then
              ConstdValue:=1.0
            else
              ConstdValue:=0;
          end
          else if sName=uppercase('@TCmSYS_BooleanEQ') then
          begin
            if (T_PTrueOld.dValue=T_PTrueNow.dValue) then
              ConstdValue:=1.0
            else
              ConstdValue:=0;
          end
          else if sName=uppercase('@TCmSYS_BooleanNE') then
          begin
            if (T_PTrueOld.dValue<>T_PTrueNow.dValue) then
              ConstdValue:=1.0
            else
              ConstdValue:=0;
          end
          else if sName=uppercase('@TCmSYS_BooleanLT') then
          begin
            if (T_PTrueOld.dValue<T_PTrueNow.dValue) then
              ConstdValue:=1.0
            else
              ConstdValue:=0;
          end
          else if sName=uppercase('@TCmSYS_BooleanGT') then
          begin
            if (T_PTrueOld.dValue>T_PTrueNow.dValue) then
              ConstdValue:=1.0
            else
              ConstdValue:=0;
          end
          else if sName=uppercase('@TCmSYS_BooleanLE') then
          begin
            if (T_PTrueOld.dValue<=T_PTrueNow.dValue) then
              ConstdValue:=1.0
            else
              ConstdValue:=0;
          end
          else if sName=uppercase('@TCmSYS_BooleanGE') then
          begin
            if (T_PTrueOld.dValue>=T_PTrueNow.dValue) then
              ConstdValue:=1.0
            else
              ConstdValue:=0;
          end
          //------------------------------------
          else if sName=uppercase('@Add') then
            ConstdValue:=T_PTrueOld.dValue+T_PTrueNow.dValue
          else if sName=uppercase('@Sub') then
            ConstdValue:=T_PTrueOld.dValue-T_PTrueNow.dValue
          else if sName=uppercase('@Mul') then
            ConstdValue:=T_PTrueOld.dValue*T_PTrueNow.dValue
          else if sName=uppercase('@Div') then
          begin
            if T_PTrueNow.dValue<>0 then
              ConstdValue:=T_PTrueOld.dValue/T_PTrueNow.dValue
            else if T_PTrueOld.dValue=0 then
              ConstdValue:=Infinity
            else if T_PTrueOld.dValue>0 then
              ConstdValue:=Infinity
            else if T_PTrueOld.dValue<0 then
              ConstdValue:=NegInfinity;
          end
          else if sName=uppercase('@DivE') then
          begin
            if T_PTrueNow.dValue<>0 then
              ConstdValue:=Trunc(T_PTrueOld.dValue/T_PTrueNow.dValue)
            else if T_PTrueOld.dValue=0 then
              ConstdValue:=Infinity
            else if T_PTrueOld.dValue>0 then
              ConstdValue:=Infinity
            else if T_PTrueOld.dValue<0 then
              ConstdValue:=NegInfinity;
          end
          else if sName=uppercase('@Mod') then
            ConstdValue:=T_PTrueOld.dValue-Trunc(T_PTrueOld.dValue/T_PTrueNow.dValue)*T_PTrueNow.dValue
          else if sName=uppercase('@Power') then
            ConstdValue:=math.Power(T_PTrueOld.dValue,T_PTrueNow.dValue)
          else if sName=uppercase('@IntPower') then
            ConstdValue:=math.IntPower(T_PTrueOld.dValue,integer(Round(T_PTrueNow.dValue)))
          else if sName=uppercase('@Max') then
            ConstdValue:=math.Max(T_PTrueOld.dValue,T_PTrueNow.dValue)
          else if sName=uppercase('@Hypot') then
            ConstdValue:=Sqrt(Sqr(T_PTrueOld.dValue)+Sqr(T_PTrueNow.dValue))
          else if sName=uppercase('@SqrAdd') then
            ConstdValue:=(Sqr(T_PTrueOld.dValue)+Sqr(T_PTrueNow.dValue))
          else if sName=uppercase('@Min') then
            ConstdValue:=math.Min(T_PTrueOld.dValue,T_PTrueNow.dValue)
          else if (sName=uppercase('@ArcTan2'))or(sName=uppercase('@Arctg2')) then
            ConstdValue:=math.ArcTan2(T_PTrueOld.dValue,T_PTrueNow.dValue)
          else
            CCost2:=false;
        end
        else
        begin
            //  �Ż�x^0,x^1,x^2,x^N  �������η�
            if ((sName=uppercase('@Power')) or (sName=uppercase('@IntPower')))
            and (Round(T_PTrueNow.dValue)=T_PTrueNow.dValue)
            and (abs(T_PTrueNow.dValue)<MaxInt) then
            begin
             { case round(T_PTrueNow.dValue) of
                //0:
                //todo: ERROR Power(1-x_3,2) �Ż�
                //  begin
                //    CCost2:=true;
                //    ConstdValue:=1;
                //  end;
                1:
                  begin
                    sName:=uppercase('@Add');
                    T_PTrueNow.dValue:=0;
                    dec(PExeAddressCode,7);  // CompileInP()���� ������� ���ɵĴ��볤���������Ϊ 7 Byte
                    dec(self.PExeAddressPMList);
                    FF_FLD_x(T_PTrueNow.dValue); // FF_FLD_x()���� ���ɵĴ��볤��ҲΪ 7 Byte
                  end;
                //todo: ERROR Power(1-x_3,2) �Ż�
                //2:
                //  begin
                //    sName:=uppercase('@Mul');
                //    ExeAddressPMList[PExeAddressPMList-1].PName:=ExeAddressPMList[PExeAddressPMList-2].PName;
                //  end; 
                else  }
                  begin
                    sName:=uppercase('@IntPower');
                  end;
              //end;
            end;
        end;

        CCost1:=true;
        if sName=uppercase('@NOT') then   // һԪ����
        begin
          if T_PTrueNow.dValue<>0 then
            ConstdValue:=0
          else
            ConstdValue:=1;
        end
        else if sName=uppercase('@Bracket') then
          ConstdValue:=(T_PTrueNow.dValue)
        else if sName=uppercase('@Sqr') then
          ConstdValue:=Sqr(T_PTrueNow.dValue)
        else if sName=uppercase('@Sqr3') then
          ConstdValue:=Sqr(T_PTrueNow.dValue)*T_PTrueNow.dValue
        else if sName=uppercase('@Sqr4') then
          ConstdValue:=Sqr(Sqr(T_PTrueNow.dValue))
        else if sName=uppercase('@Sqrt') then
          ConstdValue:=Sqrt(T_PTrueNow.dValue)
        else if sName=uppercase('@Rev') then
          begin
            if T_PTrueNow.dValue<>0 then
              ConstdValue:=1.0/T_PTrueNow.dValue
            else
              ConstdValue:=Infinity;
          end
        else if sName=uppercase('@Sin') then
          ConstdValue:=Sin(T_PTrueNow.dValue)
        else if sName=uppercase('@Cos') then
          ConstdValue:=Cos(T_PTrueNow.dValue)
        else if (sName=uppercase('@Tan')) or (sName=uppercase('@tg')) then
          ConstdValue:=math.Tan(T_PTrueNow.dValue)
        else if (sName=uppercase('@ArcSin'))  then
          ConstdValue:=math.ArcSin(T_PTrueNow.dValue)
        else if (sName=uppercase('@ArcCos') ) then
          ConstdValue:=math.ArcCos(T_PTrueNow.dValue)
        else if (sName=uppercase('@ArcTan')) or (sName=uppercase('@Arctg')) then
          ConstdValue:=ArcTan(T_PTrueNow.dValue)
        else if sName=uppercase('@Sec') then
          ConstdValue:=1.0/Cos(T_PTrueNow.dValue)
        else if sName=uppercase('@Csc') then
          ConstdValue:=1.0/Sin(T_PTrueNow.dValue)
        else if (sName=uppercase('@Ctg')) or ( sName=uppercase('@Cot'))  then
          ConstdValue:=1.0/math.Tan(T_PTrueNow.dValue)
        else if (sName=uppercase('@ArcSec'))  then
          ConstdValue:=ArcCos(1/T_PTrueNow.dValue)//math.ArcSec(T_PTrueNow.dValue)
        else if (sName=uppercase('@ArcCsc'))  then
          ConstdValue:=ArcSin(1/T_PTrueNow.dValue)//math.ArcCsc(T_PTrueNow.dValue)
        else if (sName=uppercase('@ArcCtg')) or (sName=uppercase('@ArcCot')) then
          ConstdValue:=ArcTan(1/T_PTrueNow.dValue)//math.ArcCot(T_PTrueNow.dValue)
        else if sName=uppercase('@Ln') then
          ConstdValue:=Ln(T_PTrueNow.dValue)
        else if (sName=uppercase('@Log')) or (sName=uppercase('@Log10')) then
          ConstdValue:=math.Log10(T_PTrueNow.dValue)
        else if sName=uppercase('@Log2') then
          ConstdValue:=math.Log2(T_PTrueNow.dValue)
        else if sName=uppercase('@Abs') then
          ConstdValue:=Abs(T_PTrueNow.dValue)
        else if (sName=uppercase('@Floor')) or( sName=uppercase('@Int')) then
        begin
          xTemp:=Trunc(T_PTrueNow.dValue);
          if Frac(T_PTrueNow.dValue) <0 then
            xTemp:=xTemp-1;
          ConstdValue:=xTemp;
        end
        else if sName=uppercase('@Trunc') then
          ConstdValue:=Trunc(T_PTrueNow.dValue)
        else if sName=uppercase('@Round') then
          ConstdValue:=Round(T_PTrueNow.dValue)
        else if sName=uppercase('@Ceil') then
          ConstdValue:=Ceil(T_PTrueNow.dValue)
        else if sName=uppercase('@Sgn') then
          if T_PTrueNow.dValue>0 then
             ConstdValue:=1.0
          else if T_PTrueNow.dValue<0 then
             ConstdValue:=-1.0
          else
             ConstdValue:=0.0
        else if sName=uppercase('@Exp') then
          ConstdValue:=Exp(T_PTrueNow.dValue)
        else if sName=uppercase('@SinH') then
          ConstdValue:=math.SinH(T_PTrueNow.dValue)
        else if sName=uppercase('@CosH') then
          ConstdValue:=math.CosH(T_PTrueNow.dValue)
        else if (sName=uppercase('@TanH')) or ( sName=uppercase('@tgH')) then
          ConstdValue:=math.TanH(T_PTrueNow.dValue)
        else if (sName=uppercase('@ArcSinH')) then
          ConstdValue:=math.ArcSinH(T_PTrueNow.dValue)
        else if (sName=uppercase('@ArcCosH')) then
          ConstdValue:=math.ArcCosH(T_PTrueNow.dValue)
        else if (sName=uppercase('@ArcTanH'))or( sName=uppercase('@ArctgH')) then
          ConstdValue:=math.ArcTanH(T_PTrueNow.dValue)
        else if (sName=uppercase('@SecH')) then
          ConstdValue:=math.SecH(T_PTrueNow.dValue)
        else if (sName=uppercase('@CscH'))  then
          ConstdValue:=math.CscH(T_PTrueNow.dValue)
        else if (sName=uppercase('@CtgH')) or (sName=uppercase('@CotH')) then
          ConstdValue:=math.CotH(T_PTrueNow.dValue)
        else if (sName=uppercase('@ArcSecH'))  then
          ConstdValue:=ArcCosH(1/T_PTrueNow.dValue)//math.ArcSecH(T_PTrueNow.dValue)
        else if (sName=uppercase('@ArcCscH')) then
          ConstdValue:=ArcSinH(1/T_PTrueNow.dValue)//math.ArcCscH(T_PTrueNow.dValue)
        else if (sName=uppercase('@ArcCotH')) or (sName=uppercase('@ArcCtgH')) then
          ConstdValue:=ArcTanH(1/T_PTrueNow.dValue)//math.ArcCotH(T_PTrueNow.dValue)
        else
          CCost1:=false;

        if (CCost1) and (CCost2) then
        begin
          ErrorCode:=csTCompile_Optimize_Error;
        end
        else if CCost1 then
        begin
          CompileInPReNew(ConstdValue,1);
          exit;
        end
        else if CCost2 then
        begin
          CompileInPReNew(ConstdValue,2);
          exit;
        end
        else
        begin
         // goto CompileFunction;
        end;

      end;

   end;//if FEnabledOptimizeStack
   
   // CompileFunction:

    // û�н��г����Ż�

    T_PTrueNowListIn(T_PTrueOld);
    T_PTrueOld:=T_PTrueNow;
    T_PTrueNow.isConst:=false;

    //�ɺ��������������
    if sName=uppercase('@Add') then
      F_Add
    else if sName=uppercase('@Sub') then
      F_sub
    else if sName=uppercase('@Mul') then
      F_Mul
    else if sName=uppercase('@Div') then
      F_Div
    else if sName=uppercase('@DivE') then
      F_DivE
    else if sName=uppercase('@Mod') then
      F_Mod
    else if sName=uppercase('@Power') then
      F_Power
    else if sName=uppercase('@IntPower') then
      F_IntPower
    else if sName=uppercase('@Max') then
      F_Max
    else if sName=uppercase('@Min') then
      F_Min
    else if sName=uppercase('@Bracket') then
      F_Bracket
    else if sName=uppercase('@Sqr') then
      F_Sqr
    else if sName=uppercase('@Sqr3') then
      F_Sqr3
    else if sName=uppercase('@Sqr4') then
      F_Sqr4
    else if sName=uppercase('@Sqrt') then
      F_Sqrt
    else if sName=uppercase('@Rev') then
      F_Rev
    else if sName=uppercase('@Sin') then
      F_Sin
    else if sName=uppercase('@Cos') then
      F_Cos
    else if sName=uppercase('@Tan') then
      F_Tan
    else if sName=uppercase('@tg') then
      F_Tan
    else if sName=uppercase('@ArcSin') then
      F_ArcSin
    else if sName=uppercase('@ArcCos') then
      F_ArcCos
    else if sName=uppercase('@ArcTan') then
      F_ArcTan
    else if sName=uppercase('@Arctg') then
      F_ArcTan
    else if sName=uppercase('@ArcTan2') then
      F_ArcTan2
    else if sName=uppercase('@Arctg2') then
      F_ArcTan2
    else if sName=uppercase('@Ln') then
      F_Ln
    else if sName=uppercase('@Log') then
      F_Log
    else if sName=uppercase('@Log10') then
      F_Log
    else if sName=uppercase('@Log2') then
      F_Log2
    else if sName=uppercase('@TCmSYS_Fld_Value') then
      F_SYS_Fld_Value
    else if sName=uppercase('@Abs') then
      F_Abs
    else if sName=uppercase('@Floor') then
      F_Floor
    else if sName=uppercase('@Int') then
      F_Floor
    else if sName=uppercase('@Trunc') then
      F_Trunc
    else if sName=uppercase('@Round') then
      F_Round
    else if sName=uppercase('@Ceil') then
      F_Ceil
    else if sName=uppercase('@Sgn') then
      F_Sgn
    else if sName=uppercase('@Exp') then
      F_exp
    else if sName=uppercase('@Ctg') then
      F_Ctg
    else if sName=uppercase('@Cot') then
      F_Ctg
    else if sName=uppercase('@Sec') then
      F_Sec
    else if sName=uppercase('@Csc') then 
      F_Csc
    else if sName=uppercase('@Hypot') then
      F_Hypot
    else if sName=uppercase('@TCmSYS_Fstp_Value') then
      F_SYS_Fstp_Value
    else if sName=uppercase('@TCmSYS_IF_0') then
      F_SYS_IF_0
    else if sName=uppercase('@TCmSYS_IF_1') then
      F_SYS_IF_1
    else if sName=uppercase('@SqrAdd') then
      F_SqrAdd
    else if sName=uppercase('@SinH') then
      F_SinH
    else if sName=uppercase('@CosH') then
      F_CosH
    else if sName=uppercase('@TanH') then
      F_Tanh
    else if sName=uppercase('@tgH') then
      F_Tanh
    else if sName=uppercase('@ArcCosH') then
      F_ArcCosH
    else if sName=uppercase('@ArcSinH') then
      F_ArcSinH
    else if sName=uppercase('@ArcTanH') then
      F_ArcTanh
    else if sName=uppercase('@ArctgH') then
      F_ArcTanh
    else if sName=uppercase('@SecH') then
      F_SecH
    else if sName=uppercase('@CscH') then
      F_CscH
    else if sName=uppercase('@CtgH') then
      F_CtgH
    else if sName=uppercase('@CotH') then
      F_CtgH
    else if sName=uppercase('@ArcSec') then
      F_ArcSec
    else if sName=uppercase('@ArcCsc') then
      F_ArcCsc
    else if sName=uppercase('@ArcCtg') then
      F_ArcCtg
    else if sName=uppercase('@ArcCot') then
      F_ArcCtg
    else if sName=uppercase('@ArcSecH') then
      F_ArcSecH
    else if sName=uppercase('@ArcCscH') then
      F_ArcCscH
    else if sName=uppercase('@ArcCotH') then
      F_ArcCtgH
    else if sName=uppercase('@ArcCtgH') then
      F_ArcCtgH
    else if sName=uppercase('@RND') then
      F_Rnd
    else if sName=uppercase('@Rand') then
      F_Rnd
    else if sName=uppercase('@Random') then
      F_Rnd

    else if sName=uppercase('@AND') then
      FB_AND
    else if sName=uppercase('@OR') then
      FB_OR
    else if sName=uppercase('@XOR') then
      FB_XOR
    else if sName=uppercase('@NOT') then
      FB_NOT
    else if sName=uppercase('@TCmSYS_BooleanEQ') then
      FB_EQ
    else if sName=uppercase('@TCmSYS_BooleanNE') then
      FB_NE
    else if sName=uppercase('@TCmSYS_BooleanLT') then
      FB_LT
    else if sName=uppercase('@TCmSYS_BooleanGT') then
      FB_GT
    else if sName=uppercase('@TCmSYS_BooleanLE') then
      FB_LE
    else if sName=uppercase('@TCmSYS_BooleanGE') then
      FB_GE
    ;
    if (ifSYS_ff(sName)) then
    begin
      ff_n:=strtoint(copy(sName,Length('@TCmSYS_FF_0_')+1,4));
      sName:=getSYS_ff(sName);
      if sName=uppercase('@TCmSYS_FF_0') then
        F_SYS_FF_0(ff_n)
      else if sName=uppercase('@TCmSYS_FF_1') then
        F_SYS_FF_1(ff_n)
      else if sName=uppercase('@TCmSYS_FF_2') then
        F_SYS_FF_2(ff_n);
    end;
  except
    ErrorCode:=csTCompile_Define_Error ;
  end;
end;

// �õ��ַ����б�ʶ����λ��
function  TCompile.myPos(const str:string;const key:string;const ifirst:integer):integer;
var
  L,KeyL,i   : integer;
  newStr,newKey : string;
begin
  result:=0;
  newStr:=uppercase(str);
  newKey:=uppercase(key);
  L:=length(newstr);
  keyL:=length(newkey);
  for i:=ifirst to L do
  begin
    if (newstr[i])=(newkey[1]) then
    begin
      if L-i+1>=KeyL then
      begin
        if copy(newStr,i,KeyL)=newKey then
        begin
          result:=i;
          exit;
        end;
      end;
    end;
  end;
end;

function  TCompile.GetMarkerPos(const str:string;const key:string;const ifirst:integer):integer;
var
  i  : integer;
  p  : integer;
begin
  i:=1;
  p:=ifirst;
  while i<>0 do
  begin
    i:=myPos(Str,Key,p);
    if i=0 then  //û���ҵ�
    begin
      result:=0;
      exit;
    end
    else
    begin
      if ( (i=1) or (not (str[i-1] in ['A'..'Z','a'..'z','_','0'..'9'])) ) //ǰ
      and ((i-1+length(key)=length(Str)) or (not (Str[i+length(key)] in ['A'..'Z','a'..'z','_','0'..'9'])) )   then   //��
      begin
        result:=i;
        exit;
      end
      else
      begin
        p:=i+1;
      end;
    end;
  end;
  result:=0;
end;

  function exFloatToStr(const value:extended):String;
  var
    Buffer: array[0..63] of Char;
  begin
    SetString(Result, Buffer, FloatToText(Buffer, Value, fvExtended,
      ffGeneral, 21, 0));
  end;

// ����������(Ҫ�����ı�ʶ��,������ֵ)  // ��������, Value������һ���ɼ����ֵ
//   �� Key:='a'; Value:='2' , �� Key:='b' , Value:='2*sin(PI/2)' ��;
//   �ù�����ȫ������Ԥ�����(Define)�����棬
//     ����ֵΪ����ʱ���������п���ʹ���õ��ı��뺯���ٶȸ��죬���ӿ�����ٶ�
function  TCompile.DefineConst(const Key,Value: string):boolean;
var
  TCm : TCompile;
  x   : TCmxFloat;
  strX: string;
begin
  //
  TCm:=TCompile.Create;
  try
    TCm.SetText(Value);
    if (TCm.GetErrorCode<>0) or (TCm.IfHaveUnDefineParameter) then
      result:=false
    else
    begin
      try
        x:=TCm.GetValue();
        strX:=exFloatToStr(x);
        result:=self.DefineMarker(self.FExeText,Key,'('+strX+')');
      except
        result:=false;
      end;
    end;
  finally
    TCm.Free;
  end;
end;


// �滻��ʶ��
function  TCompile.DefineMarker(var Text:string;const Key,Value : string):boolean;
var
  L,sign: integer;
  i,p,j : integer;
  sNew  : string;
  sNewKey : string;
  sNewValue : string;

begin
  L:=length(key);
  if L=0 then
  begin
    result:=false;
    exit;
  end;

    i:=0;
    j:=0;
    p:=0;
    sign:=0;
    while true do
    begin
      case sign of
        -1:    // ����״̬
          begin
            result:=false;
            exit;
          end;
        10:   // �ɹ��˳�
          begin
            Text:=sNew;
            result:=true;
            exit;
          end;
        0:    // ��ʼ״̬
          begin
            sNew:=uppercase(Text);
            sign:=1;
            p:=1;
          end;
        1:   // �ҵ���ʶ����ʼλ��
          begin
            if key[p] in [' ',#13,#10,#9] then
            begin
              inc(p);
              sign:=1;
            end
            else if key[p] in ['A'..'Z','a'..'z','_'] then
            begin
              sign:=2;
            end
            else
              sign:=-1;
          end;
        2:  // �õ���ʶ��λ��
          begin
            j:=P;
            self.GetMarkerValue0(key,p,i);
            if i=0 then
              sign:=-1
            else
            begin
              P:=i+1;
              sign:=3;
            end;
          end;
        3:  // ȡ����ʶ��
          begin
            if p=L+1 then
            begin
              sNewKey:=uppercase(copy(key,j,i-j+1));
              sNewValue:= uppercase(Value);
              P:=1;
              sign:=4;
            end
            else if Key[P] in [' ',#13,#10,#9] then
            begin
              inc(p);
              sign:=3;
            end
            else
              sign:=-1;
          end;
        4:  // �����滻
          begin
            i:=GetMarkerPos(sNew,sNewKey,P);
            if i=0 then
              sign:=10
            else
            begin
              j:=i+length(sNewKey);
              sNew:=copy(sNew,1,i-1)+sNewValue+copy(sNew,j,length(sNew)-j+1);
              p:=i+length(sNewValue);
              sign:=4;
            end;
          end;
      end;
    end;
end;

// ����Ԥ�����(Ҫ�����ı�ʶ��,����Ϊ������ֵ); // ��������������,���������µĺ���!
//   �� Key:='a'; Value:='-0.5' , �� Key:='f(x,y)',Value:='Max(x,Sin(y))'
function  TCompile.Define(const Key,Value : string):boolean;
var
  L     : integer;
  i ,j  : integer;
  sign,p    : integer;
  sOldText  : string;
  sOldKey   : string;
  sOldValue : string;
  sTemp     : string;

  PListCount      : integer;   // ��������
  PListName       : array of String;   //��������
  FName           : string;  // ��������
  Pf1,Pf2         : integer;  // ģʽƥ����ֹλ��
  PListD          : array of integer;  // ƥ��ģʽ�в���λ�� (�����źͶ��ŵ�λ��,����ΪPListCount+1)

  SYS_DefineFPName_TempFName: string;//��ʱ��������

  //�꺯��������:
  //  ��һ��: ���Key�ĺϷ��� a:�к������� b:��ʶ�����ظ� c:��ʽ��ȷ�����õ��������ƣ�������������������
  //     ���� �滻Key��Value�еĲ������ƣ���Ϊϵͳר�ò�������TCmSYS_DefineFPName_???(���)
  //  �ڶ���: �ҳ�Text��Key��ƥ��ģʽ����ֹλ�� ,���õ�ƥ��ģʽ�в���λ�� (�����źͶ��ŵ�λ��,����ΪPListCount+1)
  //    ������: ��˳���滻����õ������滻��
  //    ���Ĳ�: �滻����ģʽ
  //  ���岽: ǰ��ƥ��λ�ã�ת���ڶ�����

  function MyPos(const str:string;const Ch:char;const IFirst:integer):integer;
  var
    i  : integer;
  begin
    result:=0;
    for i:=IFirst to length(str) do
    begin
      if str[i]=ch then
      begin
        result:=i;
        exit;
      end;
    end;
  end;

  function getd(const str:string;const iFirst,iEnd:integer;var id:integer):boolean;// get next ,
  var
    i,iR   :integer;
  begin
    iR:=0;
    for i:=iFirst to iEnd do
    begin
      if str[i]='(' then
        iR:=iR-1
      else if str[i]=')' then
        iR:=iR+1
      else if (str[i]=',') and (iR=0) then
      begin
        result:=true;
        id:=i;
        exit;
      end;
    end;
    result:=false;
    id:=0;
  end;

  function GetR(const str :string;const iFirst:integer;var iEnd:integer):boolean; // �õ�  )
  var
    i,iR  :integer;
  begin
    ir:=0;
    for i:=iFirst to length(str) do
    begin
      if str[i]='(' then
        ir:=ir-1
      else if str[i]=')' then
        ir:=ir+1;
      if ir=1 then
      begin
        result:=true;
        iEnd:=i;
        exit;
      end;
    end;
    result:=false;
    iEnd:=0;
  end;

  // Ѱ��ƥ��ģʽ����ƥ��λ��
  function  GetPListD(const sText:string;const iFirst:integer;var PListD:array of integer):boolean;
  var
    i,id : integer;
    p    : integer;
    iEnd : integer;
  begin
    // ��λ'('
    for i:=iFirst+length(FName) to length(sText) do
    begin
      if sText[i]='(' then
      begin
        PListD[0]:=i;
        break;
      end
      else if sText[i] in [' ',#13,#10,#9] then
      begin

      end
      else
      begin
        result:=false;
        exit;
      end;
    end;
    P:=PListD[0];

    // ��λ')'
    if not GetR(sText,p+1,iEnd) then
    begin
      result:=false;
      exit;
    end
    else
    begin
      PListD[PListCount]:=iEnd;
    end;

    // ��λ','
    for i:=1 to PListCount-1 do  //��PListCount-1��','��Ҫ��λ
    begin
      if GetD(sText,P+1,iEnd,id) then
      begin
        PListD[i]:=id;
        P:=id;
      end
      else
      begin
        result:=false;
        exit;
      end;
    end;

    // ������','���浽')'����﷨�Ƿ���ȷ
    if GetD(sText,P+1,iEnd,id) then
    begin
      result:=false;
      exit;
    end;
    result:=true;

  end;

begin
  L:=length(key);
  if L=0 then
  begin
    result:=false;
    exit;
  end;

  P:=0;
  i:=myPos(key,'(',1);
  j:=myPos(key,')',1);
  if (i=0) and (j=0) then  // ���������������
  begin
    result:=self.DefineMarker(self.FExeText,Key,'('+Value+')');
  end
  else     // ����Ԥ����������
  begin
    sOldText :=uppercase(self.FExeText);
    sOldKey  :=uppercase(Key);
    sOldValue:=uppercase(Value);
    //��һ����
    sign:=0;
    while true do
    begin
      case sign of
        -1 :    // ����״̬
          begin
            result:=false;
            exit;
          end;
        10:    // �ɹ�״̬
          begin
            //
            break;
          end;
        0:    // ��ʼ״̬
          begin
            P:=1;
            sign:=1;
            PListCount:=0;
          end;
        1:     // �õ���������
          begin
            if sOldKey[p] in [' ',#13,#10,#9] then
            begin
              inc(p);
              sign:=1;
            end
            else if sOldKey[P] in ['A'..'Z','_'] then
            begin
              self.GetMarkerValue0(sOldKey,P,i);
              if i=0 then
                sign:=-1
              else
              begin
                Fname:=copy(sOldKey,P,i-p+1);
                P:=i+1;
                sign:=2;
              end;
            end
            else
              sign:=-1;
          end;
        2:   //
          begin
            if sOldKey[P] in [' ',#13,#10,#9] then
              inc(p)
            else if  sOldKey[P]='(' then
            begin
              inc(p);
              sign:=3;
            end
            else
              sign:=-1;
          end;
        3:
          begin
            if  sOldKey[P] in [' ',#13,#10,#9] then
              inc(p)
            else if  sOldKey[P] in ['A'..'Z','_'] then
            begin
              self.GetMarkerValue0(sOldKey,P,i);
              if i=0 then
                sign:=-1
              else
              begin
                inc(PListCount);
                setlength(PListName,PListCount);
                PListName[PListCount-1]:=copy(sOldKey,P,i-P+1);
                P:=i+1;
                sign:=4;
              end;
            end
            else
              sign:=-1;
          end;
        4:  //
          begin
            if sOldKey[P] in [' ',#13,#10,#9] then
              inc(p)
            else if sOldKey[P]=')' then
            begin
              inc(p);
              sign:=5;
            end
            else if sOldKey[P]=',' then
            begin
              inc(p);
              sign:=3;
            end
            else
              sign:=-1;
          end;
        5:
          begin
            if P=Length(sOldKey)+1 then
              sign:=10
            else if sOldKey[P] in [' ',#13,#10,#9] then
              inc(p)
            else
              sign:=-1;
          end;
      end;//end case
    end;//end while

    // ����Ƿ����ظ��Ĳ�������
    for i:=0 to PListCount-1 do
    begin
      if PListName[i]=FName then   //�꺯�����ʵݹ����
      begin
        result:=false;
        exit;
      end;
      for j:=0 to i-1 do
      begin
        if PListName[i]=PListName[j] then
        begin
          result:=false;
          exit;
        end;
      end;
    end;

    //�꺯�����ʵݹ����,������ͬ��(����),����������ʱ�滻������ѭ������
    SYS_DefineFPName_TempFName:='TCmSYS_DefineFPName_TempFName';
    if  FName=SYS_DefineFPName_TempFName then
    begin
      SYS_DefineFPName_TempFName:='TCmSYS_DefineFPName_TempFName2';
      self.DefineMarker(sOldValue,FName,SYS_DefineFPName_TempFName);
    end
    else
      self.DefineMarker(sOldValue,FName,SYS_DefineFPName_TempFName);
    {//
    if self.GetMarkerPos(sOldValue,Fname,1)>0 then
    begin
      result:=false;
      exit;
    end;}

    // ת����������Ϊϵͳ����
    for i:=0 to PListCount-1 do
    begin
      sTemp:='TCmSYS_DefineFPName_'+formatFloat('000',i);
      self.DefineMarker(sOldKey,PListName[i],sTemp);
      self.DefineMarker(sOldValue,PListName[i],sTemp);
      PListName[i]:=sTemp;
    end;

    setlength(PListD,PListCount+1);

    sign:=0;
    while true do
    begin
      case sign of
        -1:   // ����״̬
          begin
            result:=false;
            exit;
          end;
        10:  // �ɹ��滻״̬״̬
          begin
            if self.DefineMarker(sOldtext,SYS_DefineFPName_TempFName,FName) then
            begin
              self.FExeText:=sOLdText;
              result:=true;
            end
            else
              result:=false;
            exit;
          end;
        0:   // ��ʼ״̬
          begin
            P:=1;
            sign:=1;
          end;
        1:
          begin
            i:=self.GetMarkerPos(sOldText,Fname,P);
            if i=0 then
              sign:=10
            else
            begin
              if GetPListD(sOldtext,i,PListD) then
              begin
                ///
                sTemp:=sOldValue;

                for j:=0 to PListCount-1 do
                begin
                  self.DefineMarker(sTemp,PListName[j],'('+copy(sOldText,PListD[j]+1,PListD[j+1]-PListD[j]-1)+')')
                end;
                pf1:=i;
                pf2:=PListD[pListCount];
                sOldText:=copy(sOldText,1,pf1-1)+'('+sTemp+')'+copy(sOldText,pf2+1,length(sOldText)-pf2);

                p:=i;//�п���������ѭ�� , ���Բ�����꺯���ݹ����
                sign:=1;
              end
              else
              begin
                p:=i+Length(Fname);
                sign:=1;
              end;
            end;
          end;

      end;//case
    end;//end while

  end;

end;

function TCompile.Dbxch(var s:string;var str:string):boolean; // f(x,y) => ((x)f(y))
var
  i0,i1   : integer;
  i2,i3   : integer;

  function getd(const str:string;var i0:integer):boolean;  // get ,
  var
    i   :integer;
  begin
    for i:=1 to length(str) do
    begin
      if str[i]=','  then
      begin
        result:=true;
        i0:=i;
        exit;
      end;
    end;
    result:=false;
    i0:=0;
  end;

  function GetR(const str :string;const iFirst:integer;var i1:integer):boolean; // get )
  var
    i,iR  :integer;
  begin
    ir:=0;
    for i:=iFirst to length(str) do
    begin
      if str[i]='(' then
        ir:=ir-1
      else if str[i]=')' then
        ir:=ir+1;
      if ir=1 then
      begin
        result:=true;
        i1:=i;
        exit;
      end;
    end;
    result:=false;
    i1:=0;
  end;

  function GetL(const i0:integer;const str :string;var i2:integer):boolean;  // get (
  var
    i,iL  :integer;
  begin
    iL:=0;
    for i:=i0 downto 1 do
    begin
      if str[i]=')' then
        iL:=iL-1
      else if str[i]='(' then
        iL:=iL+1;
      if iL=1 then
      begin
        result:=true;
        i2:=i;
        exit;
      end;
    end;
    result:=false;
    i2:=0;
  end;

  function GetLF(const i2:integer;const str :string;var i3:integer):boolean;  // get Function Name
  var
    i   :integer;
  begin
    for i:=i2-1 downto 1 do
    begin
      if i=0 then
      begin
        result:=false;
        i3:=0;
        exit;
      end;
      case upcase(str[i]) of
        '0'..'9','A'..'Z','_':;
        else
        begin
          if i=i2-1 then
          begin
            result:=false;
            i3:=0;
            exit;
          end
          else
          begin
            result:=true;
            i3:=i+1;
            exit;
          end;
        end;
      end;
      if i=1 then
      begin
          if i=i2-1 then
          begin
            result:=false;
            i3:=0;
            exit;
          end
          else
          begin
            result:=true;
            i3:=i;
            exit;
          end;
      end;
    end;
    result:=false;
    i3:=0;
  end;

begin
  while getd(str,i0) do
  begin
    if (GetR(str,i0+1,i1)) and (GetL(i0,str,i2)) then
    begin
      if (GetLF(i2,str,i3)) then
      begin
        str:= copy(str,1,i3-1)+'('+copy(str,i2,i0-i2)+')'
             +copy(str,i3,i2-i3)+'('+copy(str,i0+1,i1-i0-1)+')'
             +copy(str,i1,length(str)-i1+1);  //��ǰ ...-i1);
                    //�������̫������,ֻ��ִ�иþ�ܶ�ε�����Ż����!�����ҳ�����:)
      end
      else
      begin
        ErrorCode:=csTCompile_Handwriting_Error;
        result:=false;
        exit;
      end;
    end
    else
    begin
      ErrorCode:=csTCompile_Handwriting_Error;
      result:=false;
      exit;
    end;
  end;
  s:=str;
  result:=true;
end;

// ��д��ʽת������  IF(a,b,c) =>TCmSYS_IF_1(TCmSYS_IF_0(b,c),a)
function  TCompile.DbxchSYS_Functionif(var s:string;var str:string):boolean;
var
  i,p   : integer;
  sign  : integer;
  sTemp : string;
  st    : string;
  PIF   : integer;
  P0,P1,P2,P3,P4 : integer;


  function getd(const str:string;const iFirst,iEnd:integer;var id:integer):boolean;// get next ,
  var
    i,iR   :integer;
  begin
    iR:=0;
    for i:=iFirst to iEnd do
    begin
      if str[i]='(' then
        iR:=iR-1
      else if str[i]=')' then
        iR:=iR+1
      else if (str[i]=',') and (iR=0) then
      begin
        result:=true;
        id:=i;
        exit;
      end;
    end;
    result:=false;
    id:=0;
  end;

  function GetR(const str :string;const iFirst:integer;var P4:integer):boolean; // �õ� if( ) �е� )
  var
    i,iR  :integer;
  begin
    ir:=0;
    for i:=iFirst to length(str) do
    begin
      if str[i]='(' then
        ir:=ir-1
      else if str[i]=')' then
        ir:=ir+1;
      if ir=1 then
      begin
        result:=true;
        p4:=i;
        exit;
      end;
    end;
    result:=false;
    p4:=0;
  end;

  function GetP2P3P4(const str:string;const p1:integer;var p2,p3,p4:integer):boolean;
  begin
    if GetR(str,p1+1,p4) then
    begin
      if (GetD(str,p1+1,p4,p2))
      and (GetD(str,p2+1,p4,p3)) then
      begin
        result:=true;
        exit;
      end
      else
      begin
        result:=false;
        exit;
      end;
    end
    else
    begin
      result:=false;
      exit;
    end;
  end;

  function MYPos(const str: string):integer;
  var
    i : integer;
  begin
    result:=0;
    for i:=1 to length(str)-1 do
    begin
      if (str[i]='I') and (str[i+1]='F') then
      begin
        result:=i;
        exit;
      end;
    end;
  end;

begin
  P:=0;
  pIF:=0;
  sign:=0;
  sTemp:=str;
  while true do
  begin
    case sign of
      -1:   // ����״̬
        begin
          self.ErrorCode:=csTCompile_IFHandwriting_Error;
          result:=false;
          exit;
        end;
      10:   // �ɹ��˳�
        begin
          s:=sTemp;
          result:=true;
          exit;
        end;
      0 :   // ��ʼ״̬
        begin
          P:=1;
          sign:=1;
        end;
      1 :   // ����IF״̬
        begin
          st:=copy(stemp,p,length(stemp)-p+1);
          i:=MYPos(st);
          if (i=0) then
            sign:=10
          else
          begin
            if ((i=1) or
            (not (st[i-1] in ['A'..'Z','0'..'9','_'])))
            and ((i<=length(st)-2) and (st[i+2] in [' ',#13,#10,#9,'('] )) then
            begin
              PIF:=P-1+i;
              P:=PIF+2;
              sign:=2;
            end
            else  // not 'if'
            begin
              P:=p-1+i+2;
              sign:=1;
            end;
          end;
        end;
      2 :   // �ҵ�IF״̬  pIF->'IF'
        begin
          if p>=length(stemp) then
            sign:=-1
          else if (stemp[p] in [' ',#13,#10,#9])  then
          begin
            inc(p);
            sign:=2;
          end
          else if stemp[p]='(' then
          begin
            p0:=PIf;
            p1:=p;
            if GetP2P3P4(stemp,p1,p2,p3,p4) then
            begin
              //�滻   IF(a,b,c) =>TCmSYS_IF_1(TCmSYS_IF_0(b,c),a)
              str:=stemp;
              stemp:=copy(str,1,p0-1)+'TCmSYS_IF_1(TCmSYS_IF_0(';
              stemp:=stemp+copy(str,p2+1,p4-p2-1)+'),';
              stemp:=stemp+copy(str,p1+1,p2-p1-1)+')';
              stemp:=stemp+copy(str,p4+1,length(str)-p4);
              P:=Pif;
              sign:=1;
            end
            else
              sign:=-1;
          end
          else
          begin
            sign:=-1;
          end;
        end;
    end;
  end;

end;

function  TCompile.DbxchSYS_ff(var s:string;var str:string):boolean; // ff(a,b,N,g(x)) => ( (a) F_TCmSYS_FF_0 (b) F_TCmSYS_FF_1 (N) F_TCmSYS_FF_2 ( g(x) ) )
var
  i0      :integer;
  i1,i2   :integer;
  i3,i4   :integer;
  i5      :integer;
  strX    :string;
  A_Z     :boolean;

  function GetStrX(var strX:string):boolean;  //�õ����ֱ����ַ���
  var
    //L   :integer;
    s   :string;
    iEnd  :integer;
  begin
    s:=strX;
    //L:=length(s);
    //if (L>2) and ( ((s[1]='''')and(s[L]='''')) or ((s[1]='"')and(s[L]='"')) ) then
    //begin
    //  s:=copy(s,2,L-2);
    //end;
    GetMarkerValue0(s,1,iEnd);
    if iEnd>0 then
    begin
      if iEnd=length(s) then
      begin
        result:=true ;
        strX:=copy(s,1,iEnd);
      end
      else
      begin
        result:=false;
        strX:='';
      end;
    end
    else
    begin
      result:=false;
      strX:='';
    end;
  end;

  function Getff(const st : string;var i0 :integer):boolean;   //�õ� ff() �е� (
  var
    i   :integer;
    str:string;
  begin
    A_Z:=false;
    str:=st+'#######';
    for i:=1 to length(str)-3 do
    begin
      if (A_Z=False) and (upcase(str[i])=upcase('f')) and (upcase(str[i+1])=upcase('f')) and (upcase(str[i+2])='(') then
      begin
        i0:=i+2;
        result:=true;
        exit;
      end;
      if str[i] in ['a'..'z','A'..'Z','0'..'9','_'] then
        A_Z:=true
      else
        A_Z:=false;
    end;
    i0:=0;
    result:=false;
  end;

  function getd(const str:string;const iFirst,iEnd:integer;var id:integer):boolean;// get next ,
  var
    i,iR   :integer;
  begin
    iR:=0;
    for i:=iFirst to iEnd do
    begin
      if str[i]='(' then
        iR:=iR-1
      else if str[i]=')' then
        iR:=iR+1
      else if (str[i]=',') and (iR=0) then
      begin
        result:=true;
        id:=i;
        exit;
      end;
    end;
    result:=false;
    id:=0;
  end;

  function GetR(const str :string;const iFirst:integer;var i5:integer):boolean; // �õ� ff( ) �е� )
  var
    i,iR  :integer;
  begin
    ir:=0;
    for i:=ifirst to length(str) do
    begin
      if str[i]='(' then
        ir:=ir-1
      else if str[i]=')' then
        ir:=ir+1;
      if ir=1 then
      begin
        result:=true;
        i5:=i;
        exit;
      end;
    end;
    result:=false;
    i5:=0;
  end;

  function  GetGxd(const str:string;const iff2:integer;var il:integer):boolean; //�ҵ�g(x)ǰ���','λ��
  var
    i,iR  :integer;
  begin
    ir:=0;
    for i:=iff2-1 downto 1 do
    begin
      if str[i]='(' then
        ir:=ir-1
      else if str[i]=')' then
        ir:=ir+1;
      if (ir=0) and (str[i]=',') then
      begin
        result:=true;
        iL:=i;
        exit;
      end;
    end;
    result:=false;
    iL:=0;
  end;

  Function Xch(const str:string;const sX:string):string; //  ���ֱ��� 'x' => 'TCmSYS_Const_ff_x_N'
  var
    cName   :string;
    strT    :string;
    i       :integer;
    s       :string;
    iEnd    :integer;

  begin
    cName:=uppercase('TCmSYS_Const_ff_x_')+inttostr(T_SYS_FF_ConstN); //���ֱ�������
    inc(T_SYS_FF_ConstN);

    strT:='('+str+')';
    i:=2;
    while i<=length(strT)-1 do
    begin
      GetMarkerValue0(strT,i,iEnd);
      if iEnd<>0 then
      begin
        s:=copy(strT,i,iEnd-i+1);
        if uppercase(s)=uppercase(sX) then
        begin
          strT:=copy(strT,1,i-1)+cName+copy(strT,iEnd+1,Length(strT)-iEnd);
        end;
      end;
      i:=i+1;
    end;

    DbxchSYS_ff(s,strT);

    dec(T_SYS_FF_ConstN);
    
    result:=strT;
  end;

begin
  while getff(str,i0) do
  begin
    if (GetR(str,i0+1,i5)) then
    begin
      if (GetD(str,i0+1,i5,i1)) then
      begin
        if (GetD(str,i1+1,i5,i2)) then
        begin
          if (GetD(str,i2+1,i5,i3)) then
          begin
            strX:=copy(str,i2+1,i3-i2-1);
            if not  GetstrX(strX) then
            begin
              ErrorCode:=csTCompile_FFHandwriting_Error;
              result:=false;
              exit;
            end;
            if (GetD(str,i3+1,i5,i4)) then
            begin
              s:= copy(str,1,i0-3)+'(';
              s:=s +'('+copy(str,i0+1,i1-1-i0)+')TCmSYS_FF_0_'+formatFloat('0000',T_SYS_FF_ConstN);   //a
              s:=s +'('+copy(str,i1+1,i2-1-i1)+')TCmSYS_FF_1_'+formatFloat('0000',T_SYS_FF_ConstN);   //b
              s:=s +'('+copy(str,i3+1,i4-1-i3)+')TCmSYS_FF_2_'+formatFloat('0000',T_SYS_FF_ConstN);   //N
              s:=s +'('+Xch(copy(str,i4+1,i5-1-i4),strX)+')';           //g(x)
              s:=s +')'+copy(str,i5+1,length(str)-i5);
              str:=s;
            end
            else   //no  N  ,Ĭ��Ϊ 1000
            begin
              s:= copy(str,1,i0-3)+'(';
              s:=s +'('+copy(str,i0+1,i1-1-i0)+')TCmSYS_FF_0_'+formatFloat('0000',T_SYS_FF_ConstN);   //a
              s:=s +'('+copy(str,i1+1,i2-1-i1)+')TCmSYS_FF_1_'+formatFloat('0000',T_SYS_FF_ConstN);   //b
              s:=s +'(1000)TCmSYS_FF_2_'+formatFloat('0000',T_SYS_FF_ConstN);   //N =1000
              s:=s +'('+Xch(copy(str,i3+1,i5-1-i3),strX)+')';           //g(x)
              s:=s +')'+copy(str,i5+1,length(str)-i5);
              str:=s;
            end;
          END
          else
          begin
            ErrorCode:=csTCompile_FFHandwriting_Error;
            result:=false;
            exit;
          end;
        end
        else
        begin
           ErrorCode:=csTCompile_FFHandwriting_Error;
           result:=false;
           exit;
        end;
      end
      else
      begin
         ErrorCode:=csTCompile_FFHandwriting_Error;
         result:=false;
         exit;
      end;
    end
    else
    begin
       ErrorCode:=csTCompile_FFHandwriting_Error;
       result:=false;
       exit;
    end;
  end;
  s:=str;
  result:=true;
end;

function  TCompile.Conversion0(var s:string;var str:string):boolean; //�õ�����(����)�б�����ת��
var
  i1,i2 :integer;
  d     :TCmxFloat;
  PName :string;
  sTemp :string;
  iNow  :integer;
  iInc  :integer;
begin
  try
    result:=false;
    if (str<>'') and (str[1]<>'#') then
    begin
      iNow:=1;
      while (ErrorCode=0) and (iNow<=Length(str)) and (str[iNow]<>'#')do
      begin
        if upcase(str[iNow]) in ['0'..'9','.'] then
        begin
          i1:=iNow;
          i2:=0;
          GetFloatValue0(str,i1,i2);
          if i2<>0 then
          begin
             d:=strtofloat(copy(str,i1,i2-i1+1));
             pName:=ParameterListIn(d);
             s:=s+PName;
             iNow:=i2+1;
          end
          else
          begin
            ErrorCode:=csTCompile_ReadFloat_Error;
            result:=false;
          end;
        end
        else if ('A'<=upcase(str[iNow])) and (upcase(str[iNow])<='Z') or ('_'=upcase(str[iNow])) then
        begin
          i1:=iNow;
          i2:=0;
          GetMarkerValue0(str,i1,i2);
          if i2<>0 then
          begin
             sTemp:=copy(str,i1,i2-i1+1);
             if IfHaveFunction(sTemp) then
             begin
               s:=s+'@'+sTemp;
               if (str[i2+1]='(') and ( FunctionList[GetFunctionIndex(sTemp)].FCCount=1) then
                 iNow:=i2+2
               else
                 iNow:=i2+1;
             end
             else
             begin
               ParameterListIn(sTemp);
               s:=s+'&'+sTemp;
               iNow:=i2+1;
             end;
          end
          else
          begin                                      
            ErrorCode:=csTCompile_ReadMarker_Error;
            result:=false;
          end;
        end
        else if upcase(str[iNow]) in ['+','-','*','/','\','%','^'] then
        begin
          case str[iNow] of
            '+': sTemp:='@Add';
            '-': sTemp:='@Sub';
            '*': sTemp:='@Mul';
            '/': sTemp:='@Div';
            '\': sTemp:='@DivE';
            '%': sTemp:='@Mod';
            '^': sTemp:='@Power';
          end;
          s:=s+sTemp;
          inc(iNow);
        end
        else if upcase(str[iNow]) in ['=','<','>'] then
        begin
          iInc:=1;
          case str[iNow] of
            '=':begin
                  sTemp:='@TCmSYS_BooleanEQ';
                  iInc:=1;
                end;
            '<':begin
                  if str[iNow+1]='>' then
                  begin
                    sTemp:='@TCmSYS_BooleanNE';
                    iInc:=2;
                  end
                  else if str[iNow+1]='=' then
                  begin
                    sTemp:='@TCmSYS_BooleanLE';
                    iInc:=2;
                  end
                  else
                  begin
                    sTemp:='@TCmSYS_BooleanLT';
                    iInc:=1;
                  end;
                end;
            '>':begin
                  if str[iNow+1]='=' then
                  begin
                    sTemp:='@TCmSYS_BooleanGE';
                    iInc:=2;
                  end
                  else
                  begin
                    sTemp:='@TCmSYS_BooleanGT';
                    iInc:=1;
                  end;
                end;
          end;
          s:=s+sTemp;
          inc(iNow,iInc);
        end
        else if upcase(str[iNow]) in ['(',')'] then
        begin
          if str[iNow]='(' then
            s:=s+'@Bracket'
          else
            s:=s+'@'+upcase(str[iNow]);
          inc(iNow);
        end
        else
        begin
          ErrorCode:=csTCompile_Read_Error;
          result:=false;
        end;
      end;//while
    end
    else
      result:=true;
  except
    ErrorCode:=csTCompile_Read_Error;
    result:=false;
  end;
end;

procedure TCompile.SetEnabledNote(Value:boolean);  //�Ƿ�����ʹ��ע��
begin
  FEnabledNote:=Value;
end;


procedure TCompile.SetEnabledOptimizeDiv(Value: boolean);
begin
  FEnabledOptimizeDiv:=Value;
end;

procedure TCompile.SetEnabledOptimizeStack(Value:boolean);  
begin
  FEnabledOptimizeStack:=Value;
end;

procedure TCompile.SetEnabledOptimizeConst(Value:boolean);
begin
  FEnabledOptimizeConst:=Value;
end;

procedure TCompile.DelStrNote(var str:string);
var
  Nstr  :string;
  i     :integer;
  iEnd  :integer;

  function GetCL(const s:string;const iFirst:integer):integer; //���� #13 #10 ��λ��
  var
    i   :integer;
  begin
    for i:=iFirst to length(s)-1 do
    begin
      if (s[i]=#13) and (s[i+1]=#10) then
      begin
        result:=i;
        exit;
      end;
    end;
    result:=0;
  end;

  function GetNextStar(const s:string;const iFirst:integer):integer; //���� */ ��λ��
  var
    i   :integer;
  begin
    for i:=iFirst to length(s)-1 do
    begin
      if (s[i]='*') and (s[i+1]='/') then
      begin
        result:=i;
        exit;
      end;
    end;
    result:=0;
  end;

  function GetNextSP(const s:string;const iFirst:integer):integer; //���� } ��λ��
  var
    i   :integer;
  begin
    for i:=iFirst to length(s)-1 do
    begin
      if (s[i]='}') then
      begin
        result:=i;
        exit;
      end;
    end;
    result:=0;
  end;

begin

  if not FEnabledNote then exit;  //������ʹ��ע��

  // ȥ��ע�Ͳ���
  str:='  '+str+'     ';
  Nstr:='';
  i:=3;
  while i<=length(str)-4 do
  begin
    if str[i]='/' then
    begin
      if str[i+1]='/' then
      begin
        iEnd:=GetCL(Str,i+2); //���� #13 #10 ��λ��
        if iEnd=0 then
          break
        else
        begin
          i:=iEnd+2;
          Nstr:=NStr+' ';
        end;
      end
      else if str[i+1]='*' then
      begin
        iEnd:=GetNextStar(Str,i+2); //���� */ ��λ��
        if iEnd=0 then
        begin
          ErrorCode:=csTCompile_Note_Match_Error;
          exit;
        end
        else
        begin
          i:=iEnd+2;
          Nstr:=NStr+' ';
        end;
      end
      else
      begin
        Nstr:=Nstr+str[i];
        inc(i);
      end;
    end
    else if str[i]='{' then
    begin
      iEnd:=GetNextSP(Str,i+1); //���� } ��λ��
      if iEnd=0 then
      begin
        ErrorCode:=csTCompile_Note_Match_Error;
        exit;
      end
      else
      begin
        i:=iEnd+1;
        Nstr:=NStr+' ';
      end;
    end
    else
    begin
      Nstr:=Nstr+str[i];
      inc(i);
    end;
  end;
  str:=Nstr;
end;

function  TCompile.CheckBK(const str:string):boolean;//������Լ��
var
  i     :integer;
  bk    :integer;
begin
  result:=true;
  bk:=0;
  for i:=1 to length(str) do
  begin
    if str[i]='(' then
      inc(bk)
    else if str[i]=')' then
    begin
      dec(bk);
      if bk<0 then
      begin
        result:=false;
        exit;
      end;
    end;
  end;
  if bk<>0 then
  begin
    result:=false;
    exit;
  end;
end;

function TCompile.Parsing(var str:string):boolean;//��һ�鷭��
var
  s     :string;
  st    :string;
  i,k,j :integer;
  i1,i2 :integer;
begin
  try
    result:=true;

    if not CheckBK(str) then
    begin
      ErrorCode:=csTCompile_Bracket_Error;
      exit;
    end;

    s:=uppercase(str);    //�����ִ�Сд

    
    DelStrNote(s); // ȥ��ע�Ͳ���
    if ErrorCode<>0  then
    begin
      result:=false;
      exit;
    end;

    s:='  '+s+'     ';
    st:='';
    for i:=3 to length(s)-4 do
    begin
      if (s[i]=#13) or (s[i]=#10) or (s[i]=#9) then  //ȥ�� TAB�� �س� �� ����->�滻Ϊ �ո�
        st:=st+' '
      else if (s[i-1]=' ') and (s[i]='M') and (s[i+1]='O') // Mod �Ĵ��� Mod ==> %
          and (s[i+2]='D') and (s[i+3]=' ') then
        st:=st+'%'
      else if (s[i-2]=' ') and (s[i-1]='M') and (s[i]='O') // Mod �Ĵ��� Mod ==> %
          and (s[i+1]='D') and (s[i+2]=' ') then
        st:=st
      else if (s[i-3]=' ') and (s[i-2]='M') and (s[i-1]='O') // Mod �Ĵ��� Mod ==> %
          and (s[i]='D') and (s[i+1]=' ') then
        st:=st
      else if s[i]='#' then
      begin
        ErrorCode:=csTCompile_Read_Error;
        result:=false;
        exit;
      end
      else
        st:=st+s[i];
    end;

    s:='  '+st+'  ';
    st:='';
    for i:=3 to length(s)-2 do
    begin
      if (s[i]='*') then       // ** ==> ^
      begin
        if (s[i+1]='*') and (s[i-1]<>'*') and (s[i+2]<>'*') then
          st:=st+'^'
        else if (s[i-1]='*') and (s[i-2]<>'*') and (s[i+1]<>'*') then
          st:=st
        else
          st:=st+s[i];
      end
      else
        st:=st+s[i];
    end;

    //       ȥ�� + - * / \ %  ^ , ǰ��Ŀո�
    //       ȥ�� ( ) ǰ��Ŀո�
    s:='   '+st+ '   ' ;
    st:='';
    i:=2;
    while i<=length(s)-1 do
    begin
      if s[i] in ['+','-','*','/','\','%','^',','  ,'(',')', '>','<','='] then   
      begin
        i1:=1;    //ȥǰ�ո�
        for k:=length(st) downto 1 do
        begin
          if st[k]<>' ' then
          begin
            i1:=k;
            break;
          end;
        end;
        st:=copy(st,1,i1)+s[i];
        
        i2:=length(s)+1;   //ȥ��ո�
        for j:=i+1 to length(s) do
        begin
          if s[j]<>' ' then
          begin
            i2:=j;
            break;
          end;
        end;
        st:=st;
        i:=i2;
      end
      else
      begin
        st:=st+s[i];
        inc(i);
      end;
    end;


    //ȥ����β�Ŀո�
    st:= '    '+st+'    ';
    i:=length(st)+1; //ȥ��
    for k:=1 to length(st) do
    begin
      if st[k]<>' ' then
      begin
        i:=k;
        break;
      end;
    end;
    st:=copy(st,i,length(st)-i-1);
    i:=0; //ȥβ
    for k:=length(st) downto 1 do
    begin
      if st[k]<>' ' then
      begin
        i:=k;
        break;
      end;
    end;
    st:=copy(st,1,i);

    s:=st;
    st:='';
    for i:=1 to length(s) do       // ���� �� �� �����ڴ��� (ȥ������,��ʱ����'0')
    begin
      if (s[i]='+') or (s[i]='-') then
      begin
        if i=1 then
          if s[i]='+' then
            st:=st
          else
            st:=st+'0'+s[i]
        else if (s[i-1]='(') or(s[i-1]=',') then
          if s[i]='+' then
            st:=st
          else
            st:=st+'0'+s[i]
        else
          st:=st+s[i];
      end
      else
        st:=st+s[i];
    end;

    s:=st+'########';      // '#' Ϊ������־
    st:='';
    DbxchSYS_ff(st,s);    // ff(a,b,N,g(x)) => ( (a) TCmSYS_FF_0 (b) TCmSYS_FF_1 (N) TCmSYS_FF_2 ( g(x) ) )
    if ErrorCode<>0  then
    begin
      result:=false;
      exit;
    end;

    s:=st+'#######';      // '#' Ϊ������־
    st:='';
    DbxchSYS_FunctionIf(st,s);
    if ErrorCode<>0  then
    begin
      result:=false;
      exit;
    end;


    s:=st+'#######';      // '#' Ϊ������־
    st:='';
    Dbxch(st,s);        //f(x,y) => ((x)f(y))
    if ErrorCode<>0  then
    begin
      result:=false;
      exit;
    end;


    s:=st+'#######';      // '#' Ϊ������־
    st:='';
    Conversion0(st,s); //�õ�����(����)�б�����ת��
    if ErrorCode<>0  then
    begin
      result:=false;
      exit;
    end;
    
    st:=uppercase(st);

    str:=st+'#######';
  except
    result:=false;
  end;
end;

function  TCompile.ifSYS_ff(const fName:string):boolean;
var
  L :integer;
begin
  result:=false;
  L:=length('@TCmSYS_FF_');
  if  ( length(fName)>=L) then
  begin
    if (uppercase(copy(fName,1,L-1))=uppercase('TCmSYS_FF_'))
      or (uppercase(copy(fName,1,L))=uppercase('@TCmSYS_FF_')) then
    begin
      result:=true;
    end;
  end
  else
    result:=false;
end;

function  TCompile.getSYS_ff(const fName:string):string;
var
  L  : integer;
begin
  L:=Length('@TCmSYS_FF_');
  if fName[1]='@' then
    result:=copy(fName,1,L+1)   //@TCmSYS_FF_N
  else
    result:='@'+copy(fName,1,L);
end;

procedure TCompile.T_PTrueNowListIN(const TP:TT_PTrue);
begin
  if PT_PTrueNowList>=high(T_PTrueNowList)-1 then
  begin
    setlength(T_PTrueNowList,2*high(T_PTrueNowList)+2);
  end;
  T_PTrueNowList[PT_PTrueNowList]:=TP;
  inc(PT_PTrueNowList);
end;

function  TCompile.T_PTrueNowListOut():TT_PTrue;
begin
  dec(PT_PTrueNowList);
  result:=T_PTrueNowList[PT_PTrueNowList];
end;

procedure  TCompile.FunctionStackIn(const s:string); //ѹ��
begin
  if PFunctionStack>=high(FunctionStack)-1 then
  begin
    setlength(FunctionStack,2*high(FunctionStack)+2);
  end;
  FunctionStack[PFunctionStack] := s;
  inc(PFunctionStack);
End ;

Function TCompile.FunctionStackOut() :string;  //����
begin
  dec(PFunctionStack) ;
  result:= FunctionStack[PFunctionStack] ;
End ;

Function TCompile.FunctionStackRead() :string;  //����
begin
  result:= FunctionStack[PFunctionStack-1] ;
End ;

function TCompile.ParameterListIn(const PName:string):integer;
var
  sName :string;
  i     :integer;
begin
  result:=-1;
  sName:=PName;
  if (sName<>'')  then
  begin
    if sName[1]<>'&' then sName:='&'+sName;
    if not IfHaveParameter(sName) then
    begin
      if PExeParameter>=high(ExeParameter)-64 then
      begin
        setlength(ExeParameter,2*high(ExeParameter)+2);
        for i:=0 to PParameterList-1 do
        begin
          if not ParameterList[i].IsExterior then
            ParameterList[i].CAddress:=@ExeParameter[ParameterList[i].CIndex];
        end;
      end;
      if PParameterList>=high(ParameterList)-1 then
      begin
        setlength(ParameterList,2*high(ParameterList)+2);
      end;
      ParameterList[PParameterList].CName:=uppercase(sName);
      ParameterList[PParameterList].CAddress:=@ExeParameter[PExeParameter];
      ParameterList[PParameterList].isConst:=false;
      ParameterList[PParameterList].CIndex:=PExeParameter;
      ParameterList[PParameterList].IsExterior:=false;
      result:=PParameterList;

      if sName='&PI' then       //���� PI=3.1415926...
      begin
        PTCmxFloat(@ExeParameter[PExeParameter])^:=3.1415926535897932384626433832795;
        ParameterList[PParameterList].isConst:=true;
      end
      else if sName='&TRUE' then     //���� true=1
      begin
        PTCmxFloat(@ExeParameter[PExeParameter])^:=1.0;
        ParameterList[PParameterList].isConst:=true;
      end
      else if sName='&FALSE' then    //���� false=0
      begin
        PTCmxFloat(@ExeParameter[PExeParameter])^:=0.0;
        ParameterList[PParameterList].isConst:=true;
      end
      else if sName='&E' then   //����e=2.718281828...
        PTCmxFloat(@ExeParameter[PExeParameter])^:=2.7182818284590452353602874713527
      else
        PTCmxFloat(@ExeParameter[PExeParameter])^:=0;

      inc(PExeParameter,SYS_EFLength);
      inc(PParameterList);
    end;
  end;
end;

function TCompile.ParameterListIn(const dValue:TCmxFloat):string;
var
   //strName  :string;
   i        :integer;
begin
  //if not IfHaveParameter(dValue,strName) then
  //begin
    if PExeParameter>=high(ExeParameter)-64 then
    begin
      setlength(ExeParameter,2*high(ExeParameter)+2);
      for i:=0 to PParameterList-1 do
      begin
        if not ParameterList[i].IsExterior then
          ParameterList[i].CAddress:=@ExeParameter[ParameterList[i].CIndex];
      end;
    end;
    if PParameterList>=high(ParameterList)-1 then
    begin
      setlength(ParameterList,2*high(ParameterList)+2);
    end;
    ParameterList[PParameterList].CName:=uppercase('&TCmSYS_Const_'+inttostr(PParameterList));
    result:=ParameterList[PParameterList].CName;
    ParameterList[PParameterList].CAddress:=@ExeParameter[PExeParameter];
    ParameterList[PParameterList].isConst:=true;        
    ParameterList[PParameterList].CIndex:=PExeParameter;
    ParameterList[PParameterList].IsExterior:=false;

    PTCmxFloat(@ExeParameter[PExeParameter])^:=dValue;

    inc(PExeParameter,SYS_EFLength);  
    inc(PParameterList);

  //end
  //else
  //begin
  //  result:=strName;
  //end;
end;

function  TCompile.GetParameterListConstIndex(const PName:string):integer;
var
  sName   :string;
  i       :integer;
begin
  sName:=PName;
  if (sName<>'')  then
  begin
    if sName[1]<>'&' then sName:='&'+sName;
    if IfHaveParameter(sName) then
    begin
      for i:=0 to PParameterList-1 do
      begin
        if (ParameterList[i].CName=uppercase(sName))
          and (ParameterList[i].isConst=true) then
        begin
          result:=i;
          exit;
        end;
      end;
    end;
  end;
  result:=-1;
end;

function TCompile.GetParameterValue(const PName:string):TCmxFloat;
var
  i     :integer;
  sName :string;
begin
  try
    result:=0;
    sName:=uppercase(PName);
    if (sName<>'')  then
    begin
      if sName[1]<>'&' then sName:='&'+sName;
      for i:= 0 to PParameterList-1 do
      begin
        if uppercase(ParameterList[i].CName)=sName then
        begin   
          result:=ParameterList[i].CAddress^;
          exit;
        end;
      end;
    end;
  except
    result:=0;
  end;
end;

Function  TCompile.GetParameterCount():integer;    //�õ�����������Ŀ
begin
  result:=PParameterList;
end;

Function  TCompile.GetFunctionPlistCount():integer;    //�����û����õĲ�������Ŀ
begin
  result:=self.FFunctionPlistCount;
end;

Function  TCompile.GetUserParameterCount():integer;    //�õ�����������Ŀ(����������)
var
  i     : integer;
  Ls    : integer;
begin
  Ls:=0;
  for i:=0 to PParameterList-1 do
  begin
    if ParameterList[i].isConst=false then
      inc(Ls);
  end;
  result:=Ls;
end;

procedure TCompile.GetParameterList(var PList:array of TParameterList); //���ز����б�
var
  i     :integer;
  Ls    : integer;
begin
  Ls:=low(PList);
  for i:=0 to PParameterList-1 do
  begin
    PList[Ls+i]:=ParameterList[i];
  end;
end;

procedure TCompile.GetUserParameterList(var PList:array of TUserParameterList); //���ز����б�(����������)
var
  i     :integer;
  Ls    : integer;
begin
  Ls:=low(PList);
  for i:=0 to PParameterList-1 do
  begin
    if ParameterList[i].isConst=false then
    begin
      PList[Ls].CName:=ParameterList[i].CName;
      PList[Ls].CAddress:=ParameterList[i].CAddress;
      inc(Ls);
    end;
  end;
end;

function  TCompile.IfHaveParameter(const PName:string):boolean;
var
  i     :integer;
  sName :string;
begin
  try
    result:=false;
    sName:=uppercase(PName);
    if (sName<>'')  then
    begin
      if sName[1]<>'&' then sName:='&'+sName;
      for i:= 0 to PParameterList-1 do
      begin
        if uppercase(ParameterList[i].CName)=sName then
        begin
          result:=true;
          exit;
        end;
      end;
    end;
  except
    result:=false;
  end;
end;

function  TCompile.IfHaveUnDefineParameter():boolean;
begin
  if self.FFunctionPlistCount<>self.GetUserParameterCount then
    result:=true
  else
    result:=false;
end;

function  TCompile.IfHaveParameter(const dValue:TCmxFloat;var cName:string):boolean;
var
  i     :integer;
begin
  try
    result:=false;
    for i:= 0 to PParameterList-1 do
    begin
      if (ParameterList[i].isConst=true)
         and (ParameterList[i].CAddress^=dValue) then
      begin
        result:=true;
        cName:=ParameterList[i].CName;
        exit;
      end;
    end;
  except
    result:=false;
  end;
end;

procedure TCompile.FunctionListIn(const s:string;const F:Pointer;const iCount:integer);
begin
  FunctionList[PFunctionList].FName:=uppercase(s);
  FunctionList[PFunctionList].FAddress:=F;
  FunctionList[PFunctionList].FCCount:=iCount;
  PFunctionList:=PFunctionList+1;
end;

procedure TCompile.GetFunctionList();
var
  i  :integer;
begin
  for i:=low(FunctionList) to high(FunctionList) do
  begin
    FunctionList[i].FName:='';
    FunctionList[i].FAddress:=Pointer(0);
    FunctionList[i].FCCount:=0;
  end;
  PFunctionList:=0;
  FunctionListIn('@Add',@TCompile.F_Add,2);
  FunctionListIn('@Sub',@TCompile.F_Sub,2);
  FunctionListIn('@Mul',@TCompile.F_Mul,2);
  FunctionListIn('@Div',@TCompile.F_Div,2);
  FunctionListIn('@DivE',@TCompile.F_DivE,2);
  FunctionListIn('@Mod',@TCompile.F_Mod,2);
  FunctionListIn('@Power',@TCompile.F_Power,2);
  FunctionListIn('@IntPower',@TCompile.F_IntPower,2);
  FunctionListIn('@Max',@TCompile.F_Max,2);
  FunctionListIn('@Min',@TCompile.F_Min,2);
  FunctionListIn('@Bracket',@TCompile.F_Bracket,1);
  FunctionListIn('@Sqr',@TCompile.F_Sqr,1);
  FunctionListIn('@Sqr3',@TCompile.F_Sqr3,1);
  FunctionListIn('@Sqr4',@TCompile.F_Sqr4,1);
  FunctionListIn('@Sqrt',@TCompile.F_Sqrt,1);
  FunctionListIn('@Rev',@TCompile.F_Rev,1);
  FunctionListIn('@Sin',@TCompile.F_Sin,1);
  FunctionListIn('@Cos',@TCompile.F_Cos,1);
  FunctionListIn('@Tan',@TCompile.F_Tan,1);
    FunctionListIn('@tg',@TCompile.F_Tan,1);
  FunctionListIn('@ArcSin',@TCompile.F_ArcSin,1);
  FunctionListIn('@ArcCos',@TCompile.F_ArcCos,1);
  FunctionListIn('@ArcTan',@TCompile.F_ArcTan,1);
  FunctionListIn('@Arctg',@TCompile.F_ArcTan,1);
  FunctionListIn('@ArcTan2',@TCompile.F_ArcTan2,2);
  FunctionListIn('@Arctg2',@TCompile.F_ArcTan2,2);
  FunctionListIn('@Ln',@TCompile.F_Ln,1);
  FunctionListIn('@Log',@TCompile.F_Log,1);
    FunctionListIn('@Log10',@TCompile.F_Log,1);
  FunctionListIn('@Log2',@TCompile.F_Log2,1);
  FunctionListIn('@TCmSYS_Fld_Value',@TCompile.F_SYS_Fld_Value,1);
  FunctionListIn('@Abs',@TCompile.F_Abs,1);
  FunctionListIn('@Floor',@TCompile.F_Floor,1);
    FunctionListIn('@Int',@TCompile.F_Floor,1);
  FunctionListIn('@Trunc',@TCompile.F_Trunc,1);
  FunctionListIn('@Round',@TCompile.F_Round,1);
  FunctionListIn('@Ceil',@TCompile.F_Ceil,1);
  FunctionListIn('@Sgn',@TCompile.F_Sgn,1);
  FunctionListIn('@Exp',@TCompile.F_exp,1);
  FunctionListIn('@Ctg',@TCompile.F_Ctg,1);
    FunctionListIn('@Cot',@TCompile.F_Ctg,1);
  FunctionListIn('@Sec',@TCompile.F_Sec,1);
  FunctionListIn('@Csc',@TCompile.F_Csc,1);
  FunctionListIn('@Hypot',@TCompile.F_Hypot,2);
  FunctionListIn('@TCmSYS_Fstp_Value',@TCompile.F_SYS_Fstp_Value,2);
  FunctionListIn('@TCmSYS_IF_0',@TCompile.F_SYS_IF_0,2);
  FunctionListIn('@TCmSYS_IF_1',@TCompile.F_SYS_IF_1,2);
  FunctionListIn('@SqrAdd',@TCompile.F_SqrAdd,2);
  FunctionListIn('@SinH',@TCompile.F_SinH,1);
  FunctionListIn('@CosH',@TCompile.F_CosH,1);
  FunctionListIn('@TanH',@TCompile.F_Tanh,1);
    FunctionListIn('@tgH',@TCompile.F_Tanh,1);
  FunctionListIn('@ArcCosH',@TCompile.F_ArcCosH,1);
  FunctionListIn('@ArcSinH',@TCompile.F_ArcSinH,1);
  FunctionListIn('@ArcTanH',@TCompile.F_ArcTanh,1);
    FunctionListIn('@ArctgH',@TCompile.F_ArcTanh,1);
  FunctionListIn('@SecH',@TCompile.F_SecH,1);
  FunctionListIn('@CscH',@TCompile.F_CscH,1);
  FunctionListIn('@CtgH',@TCompile.F_CtgH,1);
    FunctionListIn('@CotH',@TCompile.F_CtgH,1);
  FunctionListIn('@ArcSec',@TCompile.F_ArcSec,1);
  FunctionListIn('@ArcCsc',@TCompile.F_ArcCsc,1);
  FunctionListIn('@ArcCtg',@TCompile.F_ArcCtg,1);
    FunctionListIn('@ArcCot',@TCompile.F_ArcCtg,1);
  FunctionListIn('@ArcSecH',@TCompile.F_ArcSecH,1);
    FunctionListIn('@ASecH',@TCompile.F_ArcSecH,1);
  FunctionListIn('@ArcCscH',@TCompile.F_ArcCscH,1);
    FunctionListIn('@ACscH',@TCompile.F_ArcCscH,1);
  FunctionListIn('@ArcCotH',@TCompile.F_ArcCtgH,1);
    FunctionListIn('@ACotH',@TCompile.F_ArcCtgH,1);
  FunctionListIn('@RND',@TCompile.F_Rnd,1);
    FunctionListIn('@Rand',@TCompile.F_Rnd,1);
    FunctionListIn('@Random',@TCompile.F_Rnd,1);

  FunctionListIn('@TCmSYS_FF_0',@TCompile.F_SYS_FF_0,2);
  FunctionListIn('@TCmSYS_FF_1',@TCompile.F_SYS_FF_1,2);
  FunctionListIn('@TCmSYS_FF_2',@TCompile.F_SYS_FF_2,2);

  FunctionListIn('@AND',@TCompile.FB_AND,2);
  FunctionListIn('@OR',@TCompile.FB_OR,2);
  FunctionListIn('@XOR',@TCompile.FB_XOR,2);
  FunctionListIn('@NOT',@TCompile.FB_NOT,1);
  FunctionListIn('@TCmSYS_BooleanEQ',@TCompile.FB_EQ,2);
  FunctionListIn('@TCmSYS_BooleanNE',@TCompile.FB_NE,2);
  FunctionListIn('@TCmSYS_BooleanLT',@TCompile.FB_LT,2);
  FunctionListIn('@TCmSYS_BooleanGT',@TCompile.FB_GT,2);
  FunctionListIn('@TCmSYS_BooleanLE',@TCompile.FB_LE,2);
  FunctionListIn('@TCmSYS_BooleanGE',@TCompile.FB_GE,2);


end;

Function TCompile.GetFunctionIndex(const fName:string):integer;
var
  i     :integer;
  sName :string;
begin
  try
    result:=-1;
    sName:=uppercase(fName);
    if (sName<>'')  then
    begin
      if sName[1]<>'@' then sName:='@'+sName; 
      if ifSYS_ff(sName) then sName:=GetSYS_ff(sName);
      for i:= 0 to PFunctionList-1 do
      begin
        if uppercase(FunctionList[i].FName)=sName then
        begin
          result:=i;
          exit;
        end;
      end;
    end;
  except
    result:=-1;
  end;
end;

function  TCompile.IfHaveFunction (const fName:string):boolean;
var
  i     :integer;
  sName :string;
begin
  try
    result:=false;
    sName:=uppercase(fName);
    if (sName<>'')  then
    begin
      if sName[1]<>'@' then sName:='@'+sName;
      if ifSYS_ff(sName) then sName:=GetSYS_ff(sName);
      for i:= 0 to PFunctionList-1 do
      begin
        if uppercase(FunctionList[i].FName)=sName then
        begin
          result:=true;
          exit;
        end;
      end;
    end;
  except
    result:=false;
  end;
end;


//======================
//���� ����
Procedure TCompile.F_Add();
begin
  //�ӷ�
  if not OptimizeStackCall(false) then
    CompileOutP();  //[ecx] -> st , old st -> st(1)
  ExeAddressCodeIn('dec1'); //faddp st(1),st    st+st(1) -> st
end;

Procedure TCompile.F_Sub();
begin
  //����
  if not OptimizeStackCall(false) then
  begin
    CompileOutP();  //[ecx] -> st , old st -> st(1)
    ExeAddressCodeIn('dee1');  //fsubrp st(1),st    st-st(1) -> st
  end
  else
  begin
    ExeAddressCodeIn('dee9');  //fsubp st(1),st    st-st(1) -> st
  end;
  //}
end;

Procedure TCompile.F_Mul();
begin
  //�˷�
  if not OptimizeStackCall(false) then
    CompileOutP();  //[ecx] -> st , old st -> st(1)
  ExeAddressCodeIn('dec9');  //fmulp st(1),st  ,  st*st(1) -> st
end;

Procedure TCompile.F_Div();
begin
  //����
  if not OptimizeStackCall(false) then
  begin
    CompileOutP();  //[ecx] -> st , old st -> st(1)
    ExeAddressCodeIn('def1');  //fdivrp st(1),st    st/st(1) -> st
  end
  else
  begin
    ExeAddressCodeIn('def9');  //fdivp st(1),st    st/st(1) -> st
  end;
  //}
end;

Procedure TCompile.F_DivE();
begin
  //����
  if not OptimizeStackCall(false) then
  begin
    CompileOutP();  //[ecx] -> st , old st -> st(1)
    ExeAddressCodeIn('def1');  //fdivrp st(1),st    st/st(1) -> st
  end
  else
  begin
    ExeAddressCodeIn('def9');  //fdivp st(1),st    st/st(1) -> st
  end;
  F_Trunc();

end;

Procedure TCompile.F_Mod();
begin
  //����
  if not OptimizeStackCall() then
    CompileOutP();  //[ecx] -> st , old st -> st(1)
  ExeAddressCodeIn('d9f8');  //fprem ,  st-Trunc(st/st(1))*st(1) -> st
  ExeAddressCodeIn('ddd9');  //fstp st(1) ,  st ->st(1)  ,pop
end;

Procedure TCompile.F_Max();
begin
  //���ֵ
  {
  if x1>=x0 then
    result:=x1
  else
    result:=x0;

 }
 {
  asm

            fcom
            fstsw   ax
            sahf
            jnb     @elsex
              fxch    st(1)
    @elsex:
            fstp    st(1)

  end; //}
  //{
  if not OptimizeStackCall(false) then
    CompileOutP();  //[ecx] -> st , old st -> st(1)

  ExeAddressCodeIn('d8d1');     // fcompp
  ExeAddressCodeIn('9b');       // fwait
  ExeAddressCodeIn('dfe0');     // fstsw ax
  ExeAddressCodeIn('9e');       // sahf
  ExeAddressCodeIn('7302');     // jnb + $02

  ExeAddressCodeIn('d9c9');     // @else:  fxch  st(1)
  ExeAddressCodeIn('ddd9');     //fstp st(1) ,  st ->st(1)  ,pop
  //}
end;

Procedure TCompile.F_Min();
begin
  //��Сֵ
  {
  if x1>=x0 then
    result:=x0
  else
    result:=x1;

  asm

            fcom
            fstsw   ax
            sahf
            jb      @elsex
              fxch    st(1)
    @elsex:
            fstp    st(1)

  end; }

  if not OptimizeStackCall(false) then
    CompileOutP();  //[ecx] -> st , old st -> st(1)

  ExeAddressCodeIn('d8d1');     // fcompp
  ExeAddressCodeIn('9b');       // fwait
  ExeAddressCodeIn('dfe0');     // fstsw ax
  ExeAddressCodeIn('9e');       // sahf
  ExeAddressCodeIn('7202');     // jb + $02    //jnb @else

  ExeAddressCodeIn('d9c9');     // @else:  fxch  st(1)
  ExeAddressCodeIn('ddd9');     //fstp st(1) ,  st ->st(1)  ,pop
  //}
  
end;

//(*
Procedure TCompile.F_Power();
begin
  //ָ���η� Power(x,y); ��x��y�η�
  {
      if y = 0.0 then
        x := 1.0               // x^0 = 1
      else if (x = 0.0) and (y > 0.0) then
        x := 0.0               // 0^y = 0, y > 0
      else if Frac(y) = 0.0 then
      begin
        if x > 0.0 then
          x:=Exp(y*Ln(x))
        else if (Trunc(y) Mod 2)=0 then
          x:=Exp(y*Ln(-x))
        else
          x:=-Exp(y*Ln(-x));
      end
      else
        x := Exp(y * Ln(x))

  asm
        @if0:
                  fldz
                  fcomp
                  fstsw     ax
                  sahf
                  jb        @else  //(x>0)

        @elseif1:
                  fxch      st(1)
                  fldz
                  fcomp
                  fxch      st(1)
                  fstsw     ax
                  sahf
                  jne       @elseif2   //(y<>0)

                    fld1
                    fstp      st(1)
                    fstp      st(1)
                    jmp       @end

        @elseif2:
                  fldz
                  fcomp
                  fstsw     ax
                  sahf
                  jne       @elseif3  //(x<>0)

                    fldz
                    fcomp     st(2)
                    fstsw     ax
                    sahf
                    jnb       @elseif3 //(y<=0)

                      fldz
                      fstp      st(1)
                      fstp      st(1)
                      jmp       @end

        @elseif3:
                  fld       st(1)
                  fld1
                  fxch      st(1)
                  fprem
                  fstp      st(1)

                  fldz
                  fcomp
                  fxch      st(1)
                  fstp      st(1)
                  fstsw     ax
                  sahf
                  jne       @else    //(y mod 1<>0)

                    fchs
                    fldln2
                    fxch
                    fyl2x
                    fmul      st,st(1)

                    FLDL2E            //exp()...
                    FMULp   st(1),st
                    FLD  ST(0)
                    FRNDINT
                    FSUB  ST(1), ST
                    FXCH  ST(1)
                    F2XM1
                    FLD1
                    FADDp   st(1),st
                    FSCALE
                    FSTP    ST(1)

                    fxch      st(1)
                    fld1
                    fadd      st,st(0)
                    fxch      st(1)
                    fprem
                    fstp      st(1)

                    fldz
                    fcomp
                    fxch      st(1)
                    fstp      st(1)
                    fstsw     ax
                    sahf
                    je        @end    //(y mod 2=0)

                      fchs
                      jmp       @end

        @else:
                  fldln2
                  fxch  
                  fyl2x
                  fmulp     st(1),st

                  FLDL2E            //exp()...
                  FMULp   st(1),st
                  FLD  ST(0)
                  FRNDINT
                  FSUB  ST(1), ST
                  FXCH  ST(1)
                  F2XM1
                  FLD1
                  FADDp   st(1),st
                  FSCALE
                  FSTP    ST(1)

        @end:
                  fwait
                  
  end;
}

  if not OptimizeStackCall() then
    CompileOutP();  //[ecx] -> st , old st -> st(1)

  ExeAddressCodeIn('D9EE');
  ExeAddressCodeIn('D8D9');
  ExeAddressCodeIn('9B');
  ExeAddressCodeIn('DFE0');
  ExeAddressCodeIn('9E');
  ExeAddressCodeIn('0F828B000000');

  ExeAddressCodeIn('D9C9');
  ExeAddressCodeIn('D9EE');
  ExeAddressCodeIn('D8D9');
  ExeAddressCodeIn('D9C9');
  ExeAddressCodeIn('9B');
  ExeAddressCodeIn('DFE0');
  ExeAddressCodeIn('9E');
  ExeAddressCodeIn('750B');

    ExeAddressCodeIn('D9E8');
    ExeAddressCodeIn('DDD9');
    ExeAddressCodeIn('DDD9');
    ExeAddressCodeIn('E990000000');

  ExeAddressCodeIn('D9EE');
  ExeAddressCodeIn('D8D9');
  ExeAddressCodeIn('9B');
  ExeAddressCodeIn('DFE0');
  ExeAddressCodeIn('9E');
  ExeAddressCodeIn('7512');

    ExeAddressCodeIn('D9EE');
    ExeAddressCodeIn('D8DA');
    ExeAddressCodeIn('9B');
    ExeAddressCodeIn('DFE0');
    ExeAddressCodeIn('9E');
    ExeAddressCodeIn('7308');

      ExeAddressCodeIn('D9EE');
      ExeAddressCodeIn('DDD9');
      ExeAddressCodeIn('DDD9');
      ExeAddressCodeIn('EB74');

  ExeAddressCodeIn('D9C1');
  ExeAddressCodeIn('D9E8');
  ExeAddressCodeIn('D9C9');
  ExeAddressCodeIn('D9F8');
  ExeAddressCodeIn('DDD9');

  ExeAddressCodeIn('D9EE');
  ExeAddressCodeIn('D8D9');
  ExeAddressCodeIn('D9C9');
  ExeAddressCodeIn('DDD9');
  ExeAddressCodeIn('9B');
  ExeAddressCodeIn('DFE0');
  ExeAddressCodeIn('9E');
  ExeAddressCodeIn('753E');
  
    ExeAddressCodeIn('D9E0');
    ExeAddressCodeIn('D9ED');
    ExeAddressCodeIn('D9C9');
    ExeAddressCodeIn('D9F1');
    ExeAddressCodeIn('D8C9');

    F_Exp();

    ExeAddressCodeIn('D9C9');
    ExeAddressCodeIn('D9E8');
    ExeAddressCodeIn('D8C0');
    ExeAddressCodeIn('D9C9');
    ExeAddressCodeIn('D9F8');
    ExeAddressCodeIn('DDD9');

    ExeAddressCodeIn('D9EE');
    ExeAddressCodeIn('D8D9');
    ExeAddressCodeIn('D9C9');
    ExeAddressCodeIn('DDD9');
    ExeAddressCodeIn('9B');
    ExeAddressCodeIn('DFE0');
    ExeAddressCodeIn('9E');
    ExeAddressCodeIn('7422');

      ExeAddressCodeIn('D9E0');
      ExeAddressCodeIn('EB1E');

  ExeAddressCodeIn('D9ED');
  ExeAddressCodeIn('D9C9');
  ExeAddressCodeIn('D9F1');
  ExeAddressCodeIn('DEC9');

  F_Exp();

end;
//power *)

Procedure TCompile.F_IntPower();
begin
  //ָ���η� Power(x,N); ��x��N�η� NΪ����
  {
  asm
        fistp   dword ptr  [edx]
        fld1
        mov     eax,[edx]
        fxch    st(1)

        test    eax,eax
        jz      @@4
        jg      @@3
          fld1
          fdivrp  st(1),st
          neg  eax

        jmp     @@3

      @@2:
        fmul    ST(0), ST
      @@3:
        shr     eax,1
        jnc     @@2

        fmul    ST(1),ST
        jnz     @@2

      @@4:
        fstp    st
  end;
  //}

      if not OptimizeStackCall(false) then
      begin
        CompileOutP();
        ExeAddressCodeIn('D9C9');
      end;

      ExeAddressCodeIn('DB1A');
      ExeAddressCodeIn('D9E8');
      ExeAddressCodeIn('8B02');
      ExeAddressCodeIn('D9C9');
      ExeAddressCodeIn('85C0');
      ExeAddressCodeIn('7414');
      ExeAddressCodeIn('7F0A');

        ExeAddressCodeIn('D9E8');
        ExeAddressCodeIn('DEF1');
        ExeAddressCodeIn('F7D8');

      ExeAddressCodeIn('EB02');

      ExeAddressCodeIn('D8C8');
      ExeAddressCodeIn('D1E8');
      ExeAddressCodeIn('73FA');
      ExeAddressCodeIn('DCC9');
      ExeAddressCodeIn('75F6');
      ExeAddressCodeIn('DDD8');
      
end;

Procedure TCompile.F_Bracket(); { ()���� }
begin
  //ʲô������  ,�������ӱ��ʽ�е����Ų����ή�ͱ����Ժ�Ĵ���ִ���ٶ�
  //�ڲ����׷��������˳��ʱ���ʹ������
end;

Procedure TCompile.F_Sqr();
begin
  //ƽ��
  ExeAddressCodeIn('d8c8');  // fmul st(0)  ,st*st -> st
end;

Procedure TCompile.F_Sqr3();
begin
  //����
{
asm
    fld     st(0)
    fmul    st(0),st
    fmulp   st(1),st
end;
//}
  ExeAddressCodeIn('D9C0');
  ExeAddressCodeIn('D8C8');
  ExeAddressCodeIn('DEC9');
end;

Procedure TCompile.F_Sqr4();
begin
  //����
  ExeAddressCodeIn('d8c8');  // fmul st(0)  ,st*st -> st
  ExeAddressCodeIn('d8c8');  // fmul st(0)  ,st*st -> st
end;

Procedure TCompile.F_Sqrt();
begin
  //��ƽ��
  ExeAddressCodeIn('d9fa');  // fsqrt  ,st^0.5-> st
end;

Procedure TCompile.F_Rev();
begin
  //����
  ExeAddressCodeIn('d9e8');  // fld1
  ExeAddressCodeIn('def1');  //fdivrp st(1), st  st/st(1) -> st
end;

Procedure TCompile.F_Sin();
begin
  //���� Sin
  ExeAddressCodeIn('d9fe');  // fsin  ,Sin(st)-> st
end;

Procedure TCompile.F_Cos();
begin
  //���� Cos
  ExeAddressCodeIn('d9ff');    // fcos  ,Cos(st)-> st
end;

Procedure TCompile.F_Tan();
begin
  //���� tg �� Tan
  ExeAddressCodeIn('d9f2');  // ftan ,tg(st)-> st(1) : 1 -> st
  ExeAddressCodeIn('ddd8');  // fstp ,st(1)->st
end;

Procedure TCompile.F_Ln();
begin
  //��Ȼ���� Ln
   //Ln(x)=Ln(2)*Log2(x)

  ExeAddressCodeIn('d9ed');  // fldln2   , Ln(2) -> st : st-> st(1)
  ExeAddressCodeIn('d9c9');  // fxch   , st <-> st(1)
  ExeAddressCodeIn('d9f1');  // fyl2x   , st(1)*Log2(st)   -> st

end;

Procedure TCompile.F_Log();
begin
  //10�Ķ���
   //Log10(x)=Log(2)*Log2(x)

  ExeAddressCodeIn('d9ec');  // fldlg2   , Log10(2) -> st : st-> st(1)
  ExeAddressCodeIn('d9c9');  // fxch   , st <-> st(1)
  ExeAddressCodeIn('d9f1');  // fyl2x   , st(1)*Log2(st)   -> st

end;

Procedure TCompile.F_Log2();
begin
  //2�Ķ���
   //Log2(x)=1*Log2(x)

  ExeAddressCodeIn('d9e8');  // fld1   , 1 -> st : st-> st(1)
  ExeAddressCodeIn('d9c9');  // fxch   , st <-> st(1)
  ExeAddressCodeIn('d9f1');  // fyl2x   , st(1)*Log2(st)   -> st

end;

procedure TCompile.F_SYS_Fld_Value();//����������ֵ
begin
//�൱�� fld  [st]  ����֧������
{
  asm
     fistp  dword ptr   [edx]
     mov    eax,[edx]
     fld    [eax]

  end;
 }

  ExeAddressCodeIn('DB1A');
  ExeAddressCodeIn('8B02');
  {$ifdef FloatType_Extended}
  ExeAddressCodeIn('db28');  //fld  tbyte ptr [eax] ,  [eax] -> st
  {$else}
    {$ifdef FloatType_Single}
    ExeAddressCodeIn('D900');  //fld  dword ptr [eax] ,  [eax] -> st
    {$else}
    ExeAddressCodeIn('DD00');  //fld  qword ptr [eax] ,  [eax] -> st
    {$endif}
  {$endif}

end;

procedure TCompile.F_SYS_Fstp_Value();//�����д���ֵ  �൱��mov  [st],st(1)
begin
  //���������������鸳ֵ
  // SYS_Fstp(a,b)=mov [a],b ;result:=b;
{
  asm
     fistp  dword ptr  [edx]
     fld    st(0)
     mov    eax,[edx]
     fstp   [eax]
  end;
}
  if not OptimizeStackCall() then
    CompileOutP();  //[ecx] -> st , old st -> st(1)

  ExeAddressCodeIn('DB1A');
  ExeAddressCodeIn('D9C0');
  ExeAddressCodeIn('8B02');
  {$ifdef FloatType_Extended}
  ExeAddressCodeIn('DB38');                           //fstp  tbyte ptr  [eax]
  {$else}
    {$ifdef FloatType_Single}
    ExeAddressCodeIn('D918');                         //fstp  dword ptr  [eax]
    {$else}
    ExeAddressCodeIn('DD18');                         //fstp  qword ptr  [eax]
    {$endif}
  {$endif}

end;

Procedure TCompile.F_Abs();
begin
  //����ֵ
  ExeAddressCodeIn('d9e1');  // fabs   , |st|-> st
end;

Procedure TCompile.F_SqrAdd();
begin 
{
   x:=x*x+y*y

   asm
       fmul  st,st(0)
       fxch  st(1)
       fmul  st,st(0)
       faddp st(1),st
   end;
}
  if not OptimizeStackCall(false) then
    CompileOutP();  //[ecx] -> st , old st -> st(1)

  ExeAddressCodeIn('D8C8');
  ExeAddressCodeIn('D9C9');
  ExeAddressCodeIn('D8C8');
  ExeAddressCodeIn('DEC1');

end;


Procedure TCompile.F_Floor();
begin
  //�������ȡ��  Floor(x)��int(x) ֵΪ������x���������
  {
    asm

        FNSTCW  [EDX].Word          // ����Э������������,�����ָ�
        FNSTCW  [EDX+2].Word        // ����Э������������,�����޸�
        FWAIT
        OR      [EDX+2].Word, $0700  // ʹRC���������ȡ��    //���뱣֤ RC=00  Ȼ���Ϊ RC=01
        FLDCW   [EDX+2].Word         // ����Э������������,RC���Ѿ��޸�
        FRNDINT                      // ����ȡ��
        FWAIT
        FLDCW   [EDX].Word           // �ָ�Э������������

    emd;
  }

  ExeAddressCodeIn('d93a');
  ExeAddressCodeIn('d97a02');
  ExeAddressCodeIn('9b');
  ExeAddressCodeIn('66814a020007');
  ExeAddressCodeIn('d96a02');
  ExeAddressCodeIn('d9fc');
  ExeAddressCodeIn('9b');
  ExeAddressCodeIn('d92a');

end;

Procedure TCompile.F_Trunc();
begin
  //�ض�ȡ��  ��  ����ȡ��
  {
    asm

        FNSTCW  [EDX].Word          // ����Э������������,�����ָ�
        FNSTCW  [EDX+2].Word        // ����Э������������,�����޸�
        FWAIT
        OR      [EDX+2].Word, $0F00  // ʹRC������ȡ��     ��Ϊ RC=11
        FLDCW   [EDX+2].Word         // ����Э������������,RC���Ѿ��޸�
        FRNDINT                      // ����ȡ��
        FWAIT
        FLDCW   [EDX].Word           // �ָ�Э������������

    emd;
  }

  ExeAddressCodeIn('d93a');
  ExeAddressCodeIn('d97a02');
  ExeAddressCodeIn('9b');
  ExeAddressCodeIn('66814a02000f');
  ExeAddressCodeIn('d96a02');
  ExeAddressCodeIn('d9fc');
  ExeAddressCodeIn('9b');
  ExeAddressCodeIn('d92a');

end;

Procedure TCompile.F_Round();
begin
  //Round(x) ��������ȡ��
  ExeAddressCodeIn('d9fc');  //frndint , Round(st)->st        // !!! Round(2.5)->2
end;

Procedure TCompile.F_Ceil();
begin
  //Ceil(x) �������ȡ��
{
    asm

        FNSTCW  [EDX].Word          // ����Э������������,�����ָ�
        FNSTCW  [EDX+2].Word        // ����Э������������,�����޸�
        FWAIT
        OR      [EDX+2].Word, $0B00  // ʹRC���������ȡ��    //���뱣֤ RC=00  Ȼ���Ϊ RC=10
        FLDCW   [EDX+2].Word         // ����Э������������,RC���Ѿ��޸�
        FRNDINT                      // ����ȡ��
        FWAIT
        FLDCW   [EDX].Word           // �ָ�Э������������

    emd;
}

  ExeAddressCodeIn('d93a');
  ExeAddressCodeIn('d97a02');
  ExeAddressCodeIn('9b');
  ExeAddressCodeIn('66814a02000B');
  ExeAddressCodeIn('d96a02');
  ExeAddressCodeIn('d9fc');
  ExeAddressCodeIn('9b');
  ExeAddressCodeIn('d92a');

end;

Procedure TCompile.F_Sgn();
begin
  //����ź���
{
  if x>0 then
    x:=1
  else if x<0 then
    x:=-1
  else
    x:=0;

    asm
                fldz
                fcomp
                fstsw   ax
                sahf
                jnb     @else

                fld1
                fstp    st(1)
                jmp     @endx

        @else:
                fldz
                fcomp
                fstsw   ax
                sahf
                jbe     @else0

                fld1
                fchs
                fstp    st(1)
                jmp     @endx

        @else0:
                fldz
                fstp    st(1)

        @endx:
                fwait


  end;


}

  ExeAddressCodeIn('D9EE');
  ExeAddressCodeIn('D8D9');
  ExeAddressCodeIn('9B');
  ExeAddressCodeIn('DFE0');
  ExeAddressCodeIn('9E');
  ExeAddressCodeIn('7306');

  ExeAddressCodeIn('D9E8');
  ExeAddressCodeIn('DDD9');
  ExeAddressCodeIn('EB16');

  ExeAddressCodeIn('D9EE');
  ExeAddressCodeIn('D8D9');
  ExeAddressCodeIn('9B');
  ExeAddressCodeIn('DFE0');
  ExeAddressCodeIn('9E');
  ExeAddressCodeIn('7608');

  ExeAddressCodeIn('D9E8');
  ExeAddressCodeIn('D9E0');
  ExeAddressCodeIn('DDD9');
  ExeAddressCodeIn('EB04');

  ExeAddressCodeIn('D9EE');
  ExeAddressCodeIn('DDD9');

  //ExeAddressCodeIn('9B');  //fwait


end;

Procedure TCompile.F_exp();
begin
  //����Ȼ��e�Ĵη�
// e^x = 2^(x*Log2(e))

  ExeAddressCodeIn('d9ea');           //  FLDL2E              //log2e
  ExeAddressCodeIn('dec9');           //  FMULp   st(1),st    //x*log2e
  ExeAddressCodeIn('d9c0');           //  FLD  ST(0)
  ExeAddressCodeIn('d9fc');           //  FRNDINT             //Round(x*log2e)
  ExeAddressCodeIn('dce9');           //  FSUB  ST(1), ST     //x*log2e - Round(x*log2e)
  ExeAddressCodeIn('d9c9');           //  FXCH  ST(1)         //y:=2^( x*log2e - Round(x*log2e) )
  ExeAddressCodeIn('d9f0');           //  F2XM1
  ExeAddressCodeIn('d9e8');           //  FLD1
  ExeAddressCodeIn('dec1');           //  FADDp   st(1),st
  ExeAddressCodeIn('d9fd');           //  FSCALE              //st := y * 2^Round(x*log2e)
  ExeAddressCodeIn('ddd9');           //  FSTP    ST(1)

end;

Procedure TCompile.F_SinH();
begin
  //˫������
  //SinH(x)=0.5*(Exp(x) - Exp(-x))

  F_Exp();
  ExeAddressCodeIn('d9e8');           //  fld1          // , 1 ->st :st -> st(1)
  ExeAddressCodeIn('d8f1');           //  fdiv  st,st(1)  // st/st(1) -> st
  ExeAddressCodeIn('dee9');           //  fsubp  st(1),st  // st(1)-st -> st
  FF_Fld_x(0.5);
  ExeAddressCodeIn('dec9');           //  fMulp  St(1),st  //, st/st(1) -> st

end;

Procedure TCompile.F_CosH();
begin
  //˫������
  //CosH(x)=0.5*(Exp(x) + Exp(-x))

  F_Exp();

  ExeAddressCodeIn('d9e8');           //  fld1      //, 1 ->st :st -> st(1)
  ExeAddressCodeIn('d8f1');           //  fdiv  st,st(1)    //, st/st(1) -> st
  ExeAddressCodeIn('dec1');           //  faddp st(1),st    // , st(1)+st -> st
  FF_Fld_x(0.5);
  ExeAddressCodeIn('dec9');           //  fMulp  St(1),st  //, st/st(1) -> st

end;

Procedure TCompile.F_Tanh();
//const
//  MaxTanhDomain = 5678.22249441322; // Ln(MaxExtended)/2
var
  PMName  :string;
begin
   //˫������
  {

  if X > MaxTanhDomain then
    Result := 1.0
  else if X < -MaxTanhDomain then
    Result := -1.0
  else
  begin
    Result := Exp(X);
    Result := Result * Result;
    Result := (Result - 1.0) / (Result + 1.0)
  end;

  //

  asm
               push edx
               mov  edx,$12345678    //PM

      @if1:    fst  st(1)
               fld  tbyte ptr [edx]         // MaxTanhDomain -> st
               fcompp
               fstsw ax
               sahf
               jnb @if2                // jmp if  MaxTanhDomain > x
               fld1
               jmp @exit

      @if2:    fst  st(1)
               fld  tbyte ptr [edx]         // MaxTanhDomain -> st
               fchs
               fcompp
               fstsw  ax
               sahf
               jbe @else
               fld1
               fchs
               jmp @exit

      @else:   //++ st:=F_EXP(st)  // +22 = +$16
               fmul  st(0),st
               fst  st(1)
               fld1
               fsubp  st(1),st     //st(1):=st(1)-st  , pop
               fxch
               fld1
               faddp  st(1),st     //st(1):=st(1)+st, pop
               fdivp   st(1),st     //st(1):=st(1)/st ,pop

      @exit:   pop  edx

  end;
  }
  PMName:=ParameterListIn(MaxTanhDomain);
  ExeAddressCodeIn('52');  //push edx
  //pM ->edx
  ExeAddressCodeIn('BA');  //mov edx
  GetExeAddressCodeInPointerRePm(PMName);
  ExeAddressCodeIn('00000000');

  ExeAddressCodeIn('ddd1');   // @if1:    fst  st(1)
  {$ifdef FloatType_Extended}
  ExeAddressCodeIn('db2A');  //fld  tbyte ptr [edx] ,  [edx] -> st
  {$else}
    {$ifdef FloatType_Single}
    ExeAddressCodeIn('D902');  //fld  dword ptr [edx] ,  [edx] -> st
    {$else}
    ExeAddressCodeIn('DD02');  //fld  qword ptr [edx] ,  [edx] -> st
    {$endif}
  {$endif}
  ExeAddressCodeIn('ded9');   // fcompp
  ExeAddressCodeIn('9b');     // wait
  ExeAddressCodeIn('dfe0');   // fstsw ax
  ExeAddressCodeIn('9e');     // sahf
  ExeAddressCodeIn('7304');   // jnb @if2      // jmp if  MaxTanhDomain > x
  ExeAddressCodeIn('d9e8');   // fld1
  ExeAddressCodeIn('eb3a');   // jmp @exit

  ExeAddressCodeIn('ddd1');   // @if2:    fst  st(1)
  {$ifdef FloatType_Extended}
  ExeAddressCodeIn('db2A');  //fld  tbyte ptr [edx] ,  [edx] -> st    // MaxTanhDomain -> st
  {$else}
    {$ifdef FloatType_Single}
    ExeAddressCodeIn('D902');  //fld  dword ptr [edx] ,  [edx] -> st
    {$else}
    ExeAddressCodeIn('DD02');  //fld  qword ptr [edx] ,  [edx] -> st
    {$endif}
  {$endif}
  ExeAddressCodeIn('d9e0');   // fchs
  ExeAddressCodeIn('ded9');   // fcompp
  ExeAddressCodeIn('9b');     // wait
  ExeAddressCodeIn('dfe0');   // fstsw ax
  ExeAddressCodeIn('9e');     // sahf
  ExeAddressCodeIn('7606');   // jbe @else
  ExeAddressCodeIn('d9e8');   // fld1
  ExeAddressCodeIn('d9e0');   // fchs
  ExeAddressCodeIn('eb26');   // jmp @exit

  F_EXP();

  ExeAddressCodeIn('d8c8');   // fmul  st(0),st
  ExeAddressCodeIn('ddd1');   // fst  st(1)
  ExeAddressCodeIn('d9e8');   // fld1
  ExeAddressCodeIn('dee9');   // fsubp  st(1),st     //st(1):=st(1)-st  , pop
  ExeAddressCodeIn('d9c9');   // fxch
  ExeAddressCodeIn('d9e8');   // fld1
  ExeAddressCodeIn('dec1');   // faddp  st(1),st     //st(1):=st(1)+st, pop
  ExeAddressCodeIn('def9');   // fdivp   st(1),st     //st(1):=st(1)/st ,pop

  ExeAddressCodeIn('5a');     //pop  edx

end;

Procedure TCompile.F_ArcSin();
begin
  //������
  // ArcSin=ArcTan2(X, Sqrt(1 - X * X))

  ExeAddressCodeIn('ddd1');           //  FST    ST(1)=st :st=st
  ExeAddressCodeIn('d8c8');           //  Fmul    x*x -> st
  ExeAddressCodeIn('d9e8');           //  fld1    1 -> st : st -> st(1) : st(1) -> st(2)
  ExeAddressCodeIn('dee1');           //  Fsubr   1-x*x -> st : st(2)-> st(1)
  ExeAddressCodeIn('d9fa');           //  Fsqrt   Sqrt(st) -> st
  ExeAddressCodeIn('d9f3');           //  Fpatan , ArcTan(st(1),st) -> st

end;

Procedure TCompile.F_ArcCos();
begin
  //������
  // ArcCos=ArcTan2(Sqrt(1 - X * X), X)

  ExeAddressCodeIn('ddd1');           //  FST    ST(1)=st :st=st
  ExeAddressCodeIn('d8c8');           //  Fmul    x*x -> st
  ExeAddressCodeIn('d9e8');           //  fld1    1 -> st : st -> st(1) : st(1) -> st(2)
  ExeAddressCodeIn('dee1');           //  Fsubr   1-x*x -> st : st(2)-> st(1)
  ExeAddressCodeIn('d9fa');           //  Fsqrt   Sqrt(st) -> st
  ExeAddressCodeIn('d9c9');           //  Fxch    st <-> st(1)
  ExeAddressCodeIn('d9f3');           //  Fpatan , ArcTan(st(1),st) -> st

end;

Procedure TCompile.F_ArcTan();
begin
  //������
  ExeAddressCodeIn('d9e8');           //  Fld1 , 1 -> st : st-> st(1)
  ExeAddressCodeIn('d9f3');           //  Fpatan , ArcTan(st) -> st
end;

Procedure TCompile.F_ArcTan2();
begin
  //������ ,��������
{
        //ArcTan2(y,x);
        FLD     y
        FLD     x
        FPATAN
        FWAIT
}
  if not OptimizeStackCall(false) then
  begin
    CompileOutP();  //[ecx] -> st , old st -> st(1)
    ExeAddressCodeIn('d9c9');  // fxch   , st <-> st(1)
    ExeAddressCodeIn('d9f3');           //  Fpatan , ArcTan(st/st(1)) -> st
  end
  else
  begin
    ExeAddressCodeIn('d9f3');           //  Fpatan , ArcTan(st/st(1)) -> st
  end;
end;

Procedure TCompile.F_ArcSinH();
var
  PMName  :string;
begin
  //��˫������
  {
  if X = 0.0 then
    Result := 0.0
  else
  begin
    LX := Abs(X);
    if LX > 1.0e10 then
      Result := Ln(LX + LX)
    else
    begin
      Result := LX * LX;
      Result := Ln(LX + 1 + Result / (1.0 + Sqrt(1.0 + Result)));
    end;
    if X < 0.0 then
      Result := -Result;
  end;

  asm
      @if1:    fst     st(1)
               fldz                
               fcompp
               fstsw ax
               sahf
               jnz     @else1
               fldz
               jmp     @exit

      @else1:  fst     st(1)
               fstp    tbyte ptr [edx]
               fabs

         @if21:  fst     st(1)
                 push    edx
                 mov     edx,$12345678    //Pe10
                 fld     tbyte ptr [edx]         // 1.0e10 -> st
                 pop     edx
                 fcompp
                 fstsw  ax
                 sahf
                 jae     @else2
                 fadd    st,st(0)
                 fldln2            // Ln(2) -> st : st-> st(1)
                 fxch              // st <-> st(1)
                 fyl2x             // st(1)*Log2(st)   -> st
                 jmp     @exit2

         @else2: fst    st(2)
                 fmul   st,st(0)
                 fst    st(1)
                 fld1
                 faddp  st(1),st
                 fsqrt
                 fld1
                 faddp  st(1),st
                 fdivp  st(1),st
                 faddp  st(1),st
                 fld1
                 faddp  st(1),st
                 fldln2            // Ln(2) -> st : st-> st(1)
                 fxch              // st <-> st(1)
                 fyl2x             // st(1)*Log2(st)   -> st

         @exit2: fld    tbyte ptr [edx]
                 fldz
                 fcompp
                 fstsw  ax
                 sahf
                 jbe    @exit
                 fchs

      @exit:   fwait
  end;
  }
  PMName:=ParameterListIn(1.0e10);

  ExeAddressCodeIn('ddd1');   // @if1:    fst  st(1)
  ExeAddressCodeIn('d9ee');   // fldz
  ExeAddressCodeIn('ded9');   // fcompp
  ExeAddressCodeIn('9b');     // wait
  ExeAddressCodeIn('dfe0');   // fstsw ax
  ExeAddressCodeIn('9e');     // sahf
  ExeAddressCodeIn('7504');   // jnz @else1
  ExeAddressCodeIn('d9ee');   // fldz
  ExeAddressCodeIn('eb4f');   // jmp @exit

  ExeAddressCodeIn('ddd1');   // @else1:    fst  st(1)
  {$ifdef FloatType_Extended}
  ExeAddressCodeIn('DB3A');                           //fstp  tbyte ptr  [edx]
  {$else}
    {$ifdef FloatType_Single}
    ExeAddressCodeIn('D91A');                         //fstp  dword ptr  [edx]
    {$else}
    ExeAddressCodeIn('DD1A');                         //fstp  qword ptr  [edx]
    {$endif}
  {$endif}
  ExeAddressCodeIn('d9e1');     //fabs

  ExeAddressCodeIn('ddd1');   // @if21:    fst  st(1)
  ExeAddressCodeIn('52');     //push edx
  //pe10 ->edx
  ExeAddressCodeIn('BA');     //mov edx  pe10
  GetExeAddressCodeInPointerRePm(PMName);
  ExeAddressCodeIn('00000000');
  {$ifdef FloatType_Extended}
  ExeAddressCodeIn('db2A');  //fld  tbyte ptr [edx] ,  [edx] -> st    // 1.0e10 -> st
  {$else}
    {$ifdef FloatType_Single}
    ExeAddressCodeIn('D902');  //fld  dword ptr [edx] ,  [edx] -> st
    {$else}
    ExeAddressCodeIn('DD02');  //fld  qword ptr [edx] ,  [edx] -> st
    {$endif}
  {$endif}
  ExeAddressCodeIn('5a');     //pop edx
  ExeAddressCodeIn('ded9');   // fcompp
  ExeAddressCodeIn('9b');     // wait
  ExeAddressCodeIn('dfe0');   // fstsw ax
  ExeAddressCodeIn('9e');     // sahf
  ExeAddressCodeIn('730a');   // jnb @else2
  ExeAddressCodeIn('d8c0');   // fadd st,st(0)
  ExeAddressCodeIn('d9ed');  // fldln2   , Ln(2) -> st : st-> st(1)
  ExeAddressCodeIn('d9c9');  // fxch   , st <-> st(1)
  ExeAddressCodeIn('d9f1');  // fyl2x   , st(1)*Log2(st)   -> st
  ExeAddressCodeIn('eb1e');  // jmp @exit2

  ExeAddressCodeIn('ddd2');   // @else2:   fst  st(2)
  ExeAddressCodeIn('d8c8');   // fmul st,st(0)
  ExeAddressCodeIn('ddd1');   // fst  st(1)
  ExeAddressCodeIn('d9e8');   // fld1
  ExeAddressCodeIn('dec1');   // faddp st(1),st
  ExeAddressCodeIn('d9fa');   // fsqrt
  ExeAddressCodeIn('d9e8');   // fld1
  ExeAddressCodeIn('dec1');   // faddp st(1),st
  ExeAddressCodeIn('def9');   // fdivp st(1),st
  ExeAddressCodeIn('dec1');   // faddp st(1),st
  ExeAddressCodeIn('d9e8');   // fld1
  ExeAddressCodeIn('dec1');   // faddp st(1),st
  ExeAddressCodeIn('d9ed');   // fldln2   , Ln(2) -> st : st-> st(1)
  ExeAddressCodeIn('d9c9');   // fxch   , st <-> st(1)
  ExeAddressCodeIn('d9f1');   // fyl2x   , st(1)*Log2(st)   -> st

  {$ifdef FloatType_Extended}
  ExeAddressCodeIn('db2A');  //fld  tbyte ptr [edx] ,  [edx] -> st     @exit2:
  {$else}
    {$ifdef FloatType_Single}
    ExeAddressCodeIn('D902');  //fld  dword ptr [edx] ,  [edx] -> st
    {$else}
    ExeAddressCodeIn('DD02');  //fld  qword ptr [edx] ,  [edx] -> st
    {$endif}
  {$endif}
  ExeAddressCodeIn('d9ee');   // fldz
  ExeAddressCodeIn('ded9');   // fcompp
  ExeAddressCodeIn('9b');     // wait
  ExeAddressCodeIn('dfe0');   // fstsw ax
  ExeAddressCodeIn('9e');     // sahf
  ExeAddressCodeIn('7602');   // jbe  @exit
  ExeAddressCodeIn('d9e0');   // fchs   
  ExeAddressCodeIn('ddd9');  //fstp st(1) ,  st ->st(1)  ,pop
  
end;

Procedure TCompile.F_ArcCosH();
var
  PMName  :string;
begin
  //��˫������
  {
  if X <= 1.0 then
    Result := 0.0
  else if X > 1.0e10 then
    Result := Ln(X+X)
  else
    Result := Ln(X + Sqrt(X*X - 1.0));

  asm
      @if1:    fst  st(1)
               fld1                   // 1 -> st
               fcompp
               fstsw  ax
               sahf
               jb @if2                // jmp if  1 < x
               fldz
               jmp @exit

      @if2:    fst  st(1)
               push edx
               mov  edx,$12345678    //Pe10
               fld  tbyte ptr [edx]         // 1.0e10 -> st
               pop  edx
               fcompp
               fstsw  ax
               sahf
               jnb @else
               fadd st,st(0)
               fldln2            // Ln(2) -> st : st-> st(1)
               fxch              // st <-> st(1)
               fyl2x             // st(1)*Log2(st)   -> st
               jmp @exit

      @else:   fst  st(1)
               fmul st,st(0)
               fld1
               fsubp  st(1),st     //st(1):=st(1)-st  , pop
               fsqrt               //st^0.5-> st
               faddp  st(1),st
               fldln2            // Ln(2) -> st : st-> st(1)
               fxch              // st <-> st(1)
               fyl2x             // st(1)*Log2(st)   -> st

      @exit:   fwait

  end;
  }
  PMName:=ParameterListIn(1.0e10);

  ExeAddressCodeIn('ddd1');   // @if1:    fst  st(1)
  ExeAddressCodeIn('d9e8');   // fld1     // 1 -> st
  ExeAddressCodeIn('ded9');   // fcompp
  ExeAddressCodeIn('9b');     // wait
  ExeAddressCodeIn('dfe0');   // fstsw  ax
  ExeAddressCodeIn('9e');     // sahf
  ExeAddressCodeIn('7204');   // jb @if2
  ExeAddressCodeIn('d9ee');   // fldz
  ExeAddressCodeIn('eb2f');   // jmp @exit

  ExeAddressCodeIn('ddd1');   // @if1:    fst  st(1)
  ExeAddressCodeIn('52');     //push edx
  //pe10 ->edx
  ExeAddressCodeIn('BA');     //mov edx  pe10
  GetExeAddressCodeInPointerRePm(PMName);
  ExeAddressCodeIn('00000000');
  {$ifdef FloatType_Extended}
  ExeAddressCodeIn('db2A');  //fld  tbyte ptr [edx] ,  [edx] -> st
  {$else}
    {$ifdef FloatType_Single}
    ExeAddressCodeIn('D902');  //fld  dword ptr [edx] ,  [edx] -> st
    {$else}
    ExeAddressCodeIn('DD02');  //fld  qword ptr [edx] ,  [edx] -> st
    {$endif}
  {$endif}
  ExeAddressCodeIn('5a');     //pop edx
  ExeAddressCodeIn('ded9');   // fcompp
  ExeAddressCodeIn('9b');     // wait
  ExeAddressCodeIn('dfe0');   // fstsw ax
  ExeAddressCodeIn('9e');     // sahf
  ExeAddressCodeIn('730a');   // jnb @else
  ExeAddressCodeIn('d8c0');   // fadd st,st(0)
  ExeAddressCodeIn('d9ed');  // fldln2   , Ln(2) -> st : st-> st(1)
  ExeAddressCodeIn('d9c9');  // fxch   , st <-> st(1)
  ExeAddressCodeIn('d9f1');  // fyl2x   , st(1)*Log2(st)   -> st
  ExeAddressCodeIn('eb12');  // jmp @exit

  ExeAddressCodeIn('ddd1');   // @else:   fst  st(1)
  ExeAddressCodeIn('d8c8');   // fmul st,st(0)
  ExeAddressCodeIn('d9e8');   // fld1
  ExeAddressCodeIn('dee9');   // fsubp  st(1),st     //st(1):=st(1)-st  , pop
  ExeAddressCodeIn('d9fa');   // fsqrt               //st^0.5-> st
  ExeAddressCodeIn('dec1');   // faddp  st(1),st
  ExeAddressCodeIn('d9ed');  // fldln2   , Ln(2) -> st : st-> st(1)
  ExeAddressCodeIn('d9c9');  // fxch   , st <-> st(1)
  ExeAddressCodeIn('d9f1');  // fyl2x   , st(1)*Log2(st)   -> st 
  ExeAddressCodeIn('ddd9');  //fstp st(1) ,  st ->st(1)  ,pop

end;

Procedure TCompile.F_ArcTanh();
//const
//  MaxTanhDomain = 5678.22249441322; // Ln(MaxExtended)/2
var
  i       :integer;
  PM      :pointer;
  PMName  :string;
begin
  //��˫������
  {
  
  if X = 0.0 then
    Result := 0.0
  else
  begin
    LX := Abs(X);
    if LX >= 1.0 then
      Result := MaxExtended
    else
      Result := 0.5 * Ln(1+(2.0 * LX) / (1.0 - LX));
    if X < 0.0 then
      Result := -Result;
  end;

  asm
      @if1:    fst     st(1)
               fldz                   // 1 -> st
               fcompp
               fstsw  ax
               sahf
               jnz     @else1
               fldz
               jmp     @exit

      @else1:  fst     st(1)
               fstp    tbyte ptr [edx]
               fabs

         @if21:  fst     st(1)
                 fld1
                 fcompp
                 fstsw  ax
                 sahf
                 ja      @else2
                 push    edx
                 mov     edx,$12345678    //PM
                 fld     tbyte ptr [edx]  
                 pop     edx
                 jmp     @exit2

         @else2: fst    st(1)
                 fld1
                 fsub   st,st(1)
                 fxch   st(1)
                 fadd   st(0),st
                 fdiv   st,st(1)
                 fld1
                 faddp  st(1),st
                 fldln2            // Ln(2) -> st : st-> st(1)
                 fxch              // st <-> st(1)
                 fyl2x             // st(1)*Log2(st)   -> st
                 fld1
                 fadd   st(0),st
                 fdivp  st(1),st

         @exit2: fld    tbyte ptr [edx]
                 fldz
                 fcompp
                 fstsw  ax
                 sahf
                 jbe    @exit
                 fchs

      @exit:   fwait
  end;
  }
  PMName:=ParameterListIn(MaxTanhDomain);
  PM:=GetParameterAddress(PMName);

  ExeAddressCodeIn('ddd1');   // @if1:    fst  st(1)
  ExeAddressCodeIn('d9ee');   // fldz
  ExeAddressCodeIn('ded9');   // fcompp
  ExeAddressCodeIn('9b');     // wait
  ExeAddressCodeIn('dfe0');   // fstsw ax
  ExeAddressCodeIn('9e');     // sahf
  ExeAddressCodeIn('7504');   // jnz @else1
  ExeAddressCodeIn('d9ee');   // fldz
  ExeAddressCodeIn('eb47');   // jmp @exit

  ExeAddressCodeIn('ddd1');   // @else1:    fst  st(1)
    {$ifdef FloatType_Extended}
    ExeAddressCodeIn('DB3A');                           //fstp  tbyte ptr  [edx]
    {$else}
      {$ifdef FloatType_Single}
      ExeAddressCodeIn('D91A');                         //fstp  dword ptr  [edx]
      {$else}
      ExeAddressCodeIn('DD1A');                         //fstp  qword ptr  [edx]
      {$endif}
    {$endif}
  ExeAddressCodeIn('d9e1');     //fabs

  ExeAddressCodeIn('ddd1');   // @if21:    fst  st(1)
  ExeAddressCodeIn('d9e8');   // fld1
  ExeAddressCodeIn('ded9');   // fcompp
  ExeAddressCodeIn('9b');     // wait
  ExeAddressCodeIn('dfe0');   // fstsw ax
  ExeAddressCodeIn('9e');     // sahf
  ExeAddressCodeIn('770b');   // ja @else2   //jnbe + $0b
  ExeAddressCodeIn('52');     //push edx
  //pM ->edx
  i:=Cardinal(pM);
  ExeAddressCodeIn('BA');     //mov edx
  GetExeAddressCodeInPointerRePm(PMName);
  ExeAddressCodeIn(byte(i Mod 256));
  ExeAddressCodeIn(byte((i Div 256) Mod 256));
  ExeAddressCodeIn(byte((i Div (256*256)) Mod 256));
  ExeAddressCodeIn(byte((i Div (256*256*256)) Mod 256));
  {$ifdef FloatType_Extended}
  ExeAddressCodeIn('db2A');  //fld  tbyte ptr [edx] ,  [edx] -> st
  {$else}
    {$ifdef FloatType_Single}
    ExeAddressCodeIn('D902');  //fld  dword ptr [edx] ,  [edx] -> st
    {$else}
    ExeAddressCodeIn('DD02');  //fld  qword ptr [edx] ,  [edx] -> st
    {$endif}
  {$endif}

  ExeAddressCodeIn('5a');     //pop edx
  ExeAddressCodeIn('eb1c');  // jmp @exit2

  ExeAddressCodeIn('ddd1');   // @else2:   fst  st(1)
  ExeAddressCodeIn('d9e8');   // fld1
  ExeAddressCodeIn('d8e1');   // fsub  st, st(1)
  ExeAddressCodeIn('d9c9');   // fxch  st(1)
  ExeAddressCodeIn('d8c0');   // fadd  st(0), st
  ExeAddressCodeIn('d8f1');   // fdiv  st, st(1)
  ExeAddressCodeIn('d9e8');   // fld1
  ExeAddressCodeIn('dec1');   // faddp st(1) ,st
  ExeAddressCodeIn('d9ed');   // fldln2   , Ln(2) -> st : st-> st(1)
  ExeAddressCodeIn('d9c9');   // fxch   , st <-> st(1)
  ExeAddressCodeIn('d9f1');   // fyl2x   , st(1)*Log2(st)   -> st
  ExeAddressCodeIn('d9e8');   // fld1
  ExeAddressCodeIn('d8c0');   // fadd  st(0),st
  ExeAddressCodeIn('def9');   // fdivp st(1),st

  {$ifdef FloatType_Extended}
  ExeAddressCodeIn('db2A');  //fld  tbyte ptr [edx] ,  [edx] -> st    @exit2:
  {$else}
    {$ifdef FloatType_Single}
    ExeAddressCodeIn('D902');  //fld  dword ptr [edx] ,  [edx] -> st
    {$else}
    ExeAddressCodeIn('DD02');  //fld  qword ptr [edx] ,  [edx] -> st
    {$endif}
  {$endif}

  ExeAddressCodeIn('d9ee');   // fldz
  ExeAddressCodeIn('ded9');   // fcompp
  ExeAddressCodeIn('9b');     // wait
  ExeAddressCodeIn('dfe0');   // fstsw ax
  ExeAddressCodeIn('9e');     // sahf
  ExeAddressCodeIn('7602');   // jbe  @exit
  ExeAddressCodeIn('d9e0');   // fchs
  ExeAddressCodeIn('ddd9');  //fstp st(1) ,  st ->st(1)  ,pop
  ExeAddressCodeIn('ddd9');  //fstp st(1) ,  st ->st(1)  ,pop

end;

procedure TCompile.F_Rnd();
//const two2neg32: TCmxFloat = 1.0/4294967295;  // 1/(2^32-1)
var
  PRndSeed  :Pointer;
  i         :integer;
begin
  //�������
{
asm
        push    ebx
        FF_Fld_X(two2neg32);
        MOV     EBX,PRndSeed // RndSeed[0]

        IMUL    EAX,[EBX],08088405H
        INC     EAX
        MOV     [EBX],EAX
        FILD    qword ptr [EBX]


        FMULP   ST(1), ST(0)
        pop     ebx
        FMULP   ST(1), ST(0)
end;
}

  ExeAddressCodeIn('53');  //push  ebx
  FF_Fld_X(two2neg32);
  
  PRndSeed:=@RndSeed[0];
  //PRndSeed ->ebx
  i:=Cardinal(PRndSeed);      // ����Ҫˢ��
  ExeAddressCodeIn('BB');     //mov ebx  ,RndSeed
  ExeAddressCodeIn(byte(i Mod 256));
  ExeAddressCodeIn(byte((i Div 256) Mod 256));
  ExeAddressCodeIn(byte((i Div (256*256)) Mod 256));
  ExeAddressCodeIn(byte((i Div (256*256*256)) Mod 256));

  ExeAddressCodeIn('690305840808');  //IMUL    EAX,[EBX],08088405H
  ExeAddressCodeIn('40');            //INC     EAX
  ExeAddressCodeIn('8903');          //MOV     [EBX],EAX
  ExeAddressCodeIn('df2B');          //FILD    qword ptr [EBX]
 
  ExeAddressCodeIn('dec9');          //FMULP   ST(1), ST(0)
  ExeAddressCodeIn('5b');  //pop  ebx
  ExeAddressCodeIn('dec9');          //FMULP   ST(1), ST(0)


end;

procedure TCompile.F_Ctg();
begin
  //Ctg(x) =1/tg(x)

  ExeAddressCodeIn('d9f2');  // ftan ,tg(st)-> st(1) : 1 -> st
  ExeAddressCodeIn('def1');  // fdivrp st(1)  : st/st(1)->st , pop

end;

procedure TCompile.F_Sec();
begin
  //Sec(x) =1/Cos(x)

  F_Cos();
  ExeAddressCodeIn('d9e8');  // fld1  ,1-> st
  ExeAddressCodeIn('def1');  // fdivrp st(1)  : st/st(1)->st , pop

end;

procedure TCompile.F_Csc();
begin
  //Csc(x) =1/Sin(x)

  F_Sin();
  ExeAddressCodeIn('d9e8');  // fld1  ,1-> st
  ExeAddressCodeIn('def1');  // fdivrp st(1)  : st/st(1)->st , pop

end;


procedure TCompile.F_CscH();
begin
  //CosH(x)=1 / SinH(X);

  F_SinH();
  ExeAddressCodeIn('d9e8');  // fld1  ,1-> st
  ExeAddressCodeIn('def1');  // fdivrp st(1)  : st/st(1)->st , pop

end;

procedure TCompile.F_SecH();
begin
  //SecH(x)=1 / CosH(X);

  F_CosH();
  ExeAddressCodeIn('d9e8');  // fld1  ,1-> st
  ExeAddressCodeIn('def1');  // fdivrp st(1)  : st/st(1)->st , pop

end;

procedure TCompile.F_CtgH();
begin
  //CtgH(x)=1 / TanH(X);

  F_tanH();
  ExeAddressCodeIn('d9e8');  // fld1  ,1-> st
  ExeAddressCodeIn('def1');  // fdivrp st(1)  : st/st(1)->st , pop

end;

procedure TCompile.F_ArcCsc();
begin
  //������
  //ArcCsc(x)=ArcSin(1/X)  //Delphi6 ��Ϊ ArcCsc(x)=Sin(1/X)  !

  ExeAddressCodeIn('d9e8');  // fld1  ,1-> st
  ExeAddressCodeIn('def1');  // fdivrp st(1)  : st/st(1)->st , pop
  F_ArcSin();

end;

procedure TCompile.F_ArcSec();
begin
  //�������
  //ArcSec(x)=ArcCos(1/X)  //Delphi6 ��Ϊ ArcSec(x)=Cos(1/X)  !

  ExeAddressCodeIn('d9e8');  // fld1  ,1-> st
  ExeAddressCodeIn('def1');  // fdivrp st(1)  : st/st(1)->st , pop
  F_ArcCos();

end;

procedure TCompile.F_ArcCtg();
begin
  //�����к���
  //ArcCtg(x)=ArcTan(1/X)  //Delphi6 ��Ϊ ArcCtg(x)=Tan(1/X)  !
  {
  if x=0 then
    result:=pi/2
  else
    result:=ArcTan(1/X);
     
  asm
      fldz
      fcomp
      fstsw   ax
      sahf
      jnz     @elseif
        ++Fld_X(PI/2)  //++7
        fstp    st(1)
        jmp     @endif
      @elseif:
        fld1
        fdivrp  st(1),st
        fld1
        fpatan
      @endif:
  end;
  }

  ExeAddressCodeIn('D9EE');
  ExeAddressCodeIn('D8D9');
  ExeAddressCodeIn('9B');
  ExeAddressCodeIn('DFE0');
  ExeAddressCodeIn('9E');
  ExeAddressCodeIn('750B');   // jnz   $0b // @elseif

    self.FF_Fld_X(PI/2);  //++7Byte
    ExeAddressCodeIn('DDD9');
    ExeAddressCodeIn('EB08');   // jmp   $08 // @endif
  //@elseif:
    ExeAddressCodeIn('D9E8');
    ExeAddressCodeIn('DEF1');
    ExeAddressCodeIn('D9E8');
    ExeAddressCodeIn('D9F3');
  //@endif:
  
end;

procedure TCompile.F_ArcCscH();
begin   
  //ArcCscH(x)=ArcSinH(1/x);
  //  Delphi6 ��Ϊ��ArcCscH(x)= 1 / ArcCsc(X);!
  //  Delphi7 ��Ϊ��ArcCscH(x)= Ln(Sqrt(1 + (1 / (X * X)) + (1 / X)));!! ע������λ��

  {
  ExeAddressCodeIn('d9e8');  // fld1  ,1-> st
  ExeAddressCodeIn('def1');  // fdivrp st(1)  : st/st(1)->st , pop
  F_ArcSinH();
  }
  //�����ʽ��ArcCscH(x)= Ln(Sqrt(1 + (1 / (X * X))) + (1 / X));
  {
      asm
          fld1
          fdivrp    st(1),st
          fld       st
          fmul      st(0),st
          fld1
          faddp     st(1),st
          fsqrt
          faddp     st(1),st

          ++F_Ln();

      end;
  }

  ExeAddressCodeIn('D9E8');
  ExeAddressCodeIn('DEF1');
  ExeAddressCodeIn('D9C0');
  ExeAddressCodeIn('D8C8');
  ExeAddressCodeIn('D9E8');
  ExeAddressCodeIn('DEC1');
  ExeAddressCodeIn('D9FA');
  ExeAddressCodeIn('DEC1');

  F_Ln();

end;

procedure TCompile.F_ArcSecH();
begin
  //��˫�������
  //ArcSecH(x)=ArcCosH(1/X)  //Delphi6 ��Ϊ ArcSecH(x)=1/ArcSec(X) !
  {
  ExeAddressCodeIn('d9e8');  // fld1  ,1-> st
  ExeAddressCodeIn('def1');  // fdivrp st(1)  : st/st(1)->st , pop
  F_ArcCosH();
  }
  //�����ʽ: ArcSecH(x)=Ln((Sqrt(1 - X * X) + 1) / X);
  {
      asm
          fld     st
          fmul    st(0),st
          fld1
          fsubrp  st(1),st
          fsqrt
          fld1
          faddp   st(1),st
          fdivrp  st(1),st

          ++F_Ln();

      end;
  }
  
  ExeAddressCodeIn('D9C0');
  ExeAddressCodeIn('D8C8');
  ExeAddressCodeIn('D9E8');
  ExeAddressCodeIn('DEE1');
  ExeAddressCodeIn('D9FA');
  ExeAddressCodeIn('D9E8');
  ExeAddressCodeIn('DEC1');
  ExeAddressCodeIn('DEF1');

  F_Ln();

end;

procedure TCompile.F_ArcCtgH();
begin
  //��˫�����к���
  //ArcCtgH(x)=ArcTanH(1/X)  //Delphi6 ��Ϊ ArcCotH(x)=1/ArcCot(X) !
  {
  ExeAddressCodeIn('d9e8');  // fld1  ,1-> st
  ExeAddressCodeIn('def1');  // fdivrp st(1)  : st/st(1)->st , pop
  F_ArcTanH();
  }
  //�����ʽ��ArcCtgH(x)= 0.5 * Ln((X + 1) / (X - 1));
  {
     asm   
       fld    st
       fld1
       fsub   st(2),st
       faddp  st(1),st
       fdivrp st(1),st

       ++F_Ln();
       ++FFLD_Half;

       fmulp  st(1),st
     end;
  }
        
  ExeAddressCodeIn('d9c0');
  ExeAddressCodeIn('d9e8');
  ExeAddressCodeIn('dcea');
  ExeAddressCodeIn('dec1');
  ExeAddressCodeIn('def1');

  F_Ln();
  FF_Fld_X(0.5);

  ExeAddressCodeIn('dec9');

end;

procedure TCompile.F_Hypot();
begin
  //Hypot(x,y)=Sqrt(x*x+y*y)

  if not OptimizeStackCall(false) then
    CompileOutP();  //[ecx] -> st , old st -> st(1)

  ExeAddressCodeIn('d8c8');  // fmul  st,st(0)
  ExeAddressCodeIn('d9c9');  // fxch   , st <-> st(1)
  ExeAddressCodeIn('d8c8');  // fmul  st,st(0)
  ExeAddressCodeIn('dec1');  // faddp st(1),st    st+st(1) -> st

  F_Sqrt();

end;

procedure  TCompile.F_SYS_IF_0();   //IF����0
begin
  // ���� IF(a,b,c) =>TCmSYS_IF_1(TCmSYS_IF_0(b,c),a)
  // ��ʱ  c->st , b->��ջ
  // ʲôҲ����
end;

procedure  TCompile.F_SYS_IF_1();   //IF����1
begin
  // ���� IF(a,b,c) =>TCmSYS_IF_1(TCmSYS_IF_0(b,c),a)
  // ��ʱ  a->st(0) , c->��ջ , b->��ջ
  if not OptimizeStackCall() then
    CompileOutP();  //[ecx] -> st , old st -> st(1)
  if not OptimizeStackCall() then
    CompileOutP();  //[ecx] -> st , old st -> st(1)
  // ��ʱ  c->st(0) , b->st(1), a->st(2)

 { asm
      fxch      st(2)
      fldz
      fcompp
      fstsw ax
      sahf
      jnz        @elseif

        fstp      st(1)
        jmp       @endif
    @elseif:
        fstp      st(0)
    @endif:
    
  end;
 }

  ExeAddressCodeIn('D9CA');
  ExeAddressCodeIn('D9EE');
  ExeAddressCodeIn('DED9');
  ExeAddressCodeIn('9B');
  ExeAddressCodeIn('DFE0');
  ExeAddressCodeIn('9E');
  ExeAddressCodeIn('7504');

  ExeAddressCodeIn('DDD9');
  ExeAddressCodeIn('EB02');
  ExeAddressCodeIn('DDD8');

end;

procedure  TCompile.F_SYS_FF_0(const N:integer); //���ֺ���0
begin
  //( (a) TCmSYS_FF_0 (b) TCmSYS_FF_1 (N) TCmSYS_FF_2 ( g(x) ) )
  //��ʱ b -> st : a -> ��ջ
  //����ʲô������
end;

procedure  TCompile.F_SYS_FF_1(const N:integer); //���ֺ���1
var
  ix   :integer;
  Px   :pointer;
 // ,iExe  ,Pexe
  function  GetEDXFstp(const i0:integer):string;
  var
    i :integer;
  begin
    i:=i0+N*8*SYS_EFLength;   //�����ػ���(����Ƕ)
    {$ifdef FloatType_Extended}
    result:=('DBBA');                           //fstp  tbyte ptr  [edx+i]
    {$else}
      {$ifdef FloatType_Single}
      result:=('D99A');                         //fstp  dword ptr  [edx+i]
      {$else}
      result:=('DD9A');                         //fstp  qword ptr  [edx+i]
      {$endif}
    {$endif}
    result:=result+inttohex(byte(i Mod 256),2);
    result:=result+inttohex(byte((i Div 256) Mod 256),2);
    result:=result+inttohex(byte((i Div (256*256)) Mod 256),2);
    result:=result+inttohex(byte((i Div (256*256*256)) Mod 256),2);
  end;

  function  GetEDXFld(const i0:integer):string;
  var
    i :integer;
  begin
    i:=i0+N*8*SYS_EFLength;   //�����ػ���(����Ƕ)
    {$ifdef FloatType_Extended}
    result:=('dbAA');  //fld  tbyte ptr [edx+i]
    {$else}
      {$ifdef FloatType_Single}
      result:=('D982');  //fld  dword ptr [edx+i]
      {$else}
      result:=('DD82');  //fld  qword ptr [edx+i]
      {$endif}
    {$endif}
    result:=result+inttohex(byte(i Mod 256),2);
    result:=result+inttohex(byte((i Div 256) Mod 256),2);
    result:=result+inttohex(byte((i Div (256*256)) Mod 256),2);
    result:=result+inttohex(byte((i Div (256*256*256)) Mod 256),2);
  end;
  
begin
  //( (a) TCmSYS_FF_0 (b) TCmSYS_FF_1 (N) TCmSYS_FF_2 ( g(x) ) )
  //��ʱ N -> st : b -> ��ջ : a -> ��ջ
  //���������� N,b,a
  //����ѭ���Ĵ��� (ѭ�����Ԥ����,�õ� TCmSYS_FF_2 ����Ҫ�ķ��ص�ַ)

  //  GetExeAddressCodeInPointer:��ǰ�����ַ  TCmSYS_Const_ff_x_N:���ֱ�������


  //ExeAddressCodeIn('d9e1');       //fabs   , |st|-> st  // N:=|N|
  //ExeAddressCodeIn('d9e8');       //fld1
  //ExeAddressCodeIn('dec1');       //faddp st(1),st   //N=N+1;
  ExeAddressCodeIn('d9fc');       //frndint          //N=Trunc(N)

  CompileOutP();  //[ecx] -> st , old st -> st(1)   //b out
  CompileOutP();  //[ecx] -> st , old st -> st(1)   //a out

  ExeAddressCodeIn(GetEDXFstp(2*SYS_EFLength));     //fstp tByte ptr [edx+2*SYS_EFLength]  //a
  ExeAddressCodeIn(GetEDXFstp(3*SYS_EFLength));     //fstp tByte ptr [edx+3*SYS_EFLength]  //b
  ExeAddressCodeIn(GetEDXFstp(4*SYS_EFLength));     //fstp tByte ptr [edx+4*SYS_EFLength]  //N
  //ExeAddressCodeIn('db5a40');     //fistp dWord ptr [edx+4*SYS_EFLength]  //N

  ExeAddressCodeIn('53');//  push      ebx
  ExeAddressCodeIn('50');//  push      eax
  px:=GetParameterAddress('TCmSYS_Const_ff_x_'+inttostr(N));
  if Cardinal(px)=0 then
  begin
     ParameterListIn('TCmSYS_Const_ff_x_'+inttostr(N));
     px:=GetParameterAddress('TCmSYS_Const_ff_x_'+inttostr(N));
  end;
  ix:=Cardinal(Px);
  ExeAddressCodeIn('BB');     //mov ebx
  GetExeAddressCodeInPointerRePm('TCmSYS_Const_ff_x_'+inttostr(N));
  ExeAddressCodeIn(byte(ix Mod 256));
  ExeAddressCodeIn(byte((ix Div 256) Mod 256));
  ExeAddressCodeIn(byte((ix Div (256*256)) Mod 256));
  ExeAddressCodeIn(byte((ix Div (256*256*256)) Mod 256));  //  mov   ebx,ix   //x Address


  ExeAddressCodeIn(GetEDXFld(2*SYS_EFLength));//  fld       tByte ptr [edx+2*SYS_EFLength]  //a
  ExeAddressCodeIn(GetEDXFld(3*SYS_EFLength));//  fld       tByte ptr [edx+3*SYS_EFLength]  //b
  ExeAddressCodeIn('dee1');  //  fsubrp    st(1),st            //b-a
  ExeAddressCodeIn(GetEDXFld(4*SYS_EFLength));//  fld       tByte ptr [edx+4*SYS_EFLength]  //n
  ExeAddressCodeIn('def9');  //  fdivp     st(1),st            //(b-a)/n =dx
  ExeAddressCodeIn('ddd1');  //  fst       st(1),st
  ExeAddressCodeIn(GetEDXFstp(5*SYS_EFLength));//  fstp      tByte ptr [edx+5*SYS_EFLength]  //dx
  ExeAddressCodeIn('d9e8');  //  fld1
  ExeAddressCodeIn('d8c0');  //  fadd      st(0),st
  ExeAddressCodeIn('def9');  //  fdivrp    st(1),st            //dx/2
  ExeAddressCodeIn(GetEDXFld(2*SYS_EFLength));//  fld       tByte ptr [edx+2*SYS_EFLength]  //a
  ExeAddressCodeIn('dec1');  //  faddp     st(1),st            //a+dx/2 =x0
    {$ifdef FloatType_Extended}
    ExeAddressCodeIn('DB3B');                           //fstp  tbyte ptr  [ebx]
    {$else}
      {$ifdef FloatType_Single}
      ExeAddressCodeIn('D91B');                         //fstp  dword ptr  [ebx]
      {$else}
      ExeAddressCodeIn('DD1B');                         //fstp  qword ptr  [ebx]
      {$endif}
    {$endif}  ExeAddressCodeIn('d9ee');  // fldz
  ExeAddressCodeIn(GetEDXFstp(6*SYS_EFLength));// fstp      tByte ptr [edx+6*SYS_EFLength]  // Sum = 0
  ExeAddressCodeIn('d9ee');  // fldz
  ExeAddressCodeIn(GetEDXFstp(7*SYS_EFLength));// fstp      tByte ptr [edx+7*SYS_EFLength]  // i = 0

  //pExe:=
  GetExeAddressCodeInPointerReCode();    //����ĵ�ַ�п��ܱ䶯(SetLength����),������ɺ����������
  //iExe:=Cardinal(PExe)+5;
  ExeAddressCodeIn('B8');     //mov eax
  ExeAddressCodeIn('00000000');
  //ExeAddressCodeIn(byte(iExe Mod 256));
 // ExeAddressCodeIn(byte((iExe Div 256) Mod 256));
 // ExeAddressCodeIn(byte((iExe Div (256*256)) Mod 256));
 // ExeAddressCodeIn(byte((iExe Div (256*256*256)) Mod 256)); //  mov   eax,iExe   //return Address

  ExeAddressCodeIn('50');//  push      eax

  ExeAddressCodeIn('d9ee');     // fldz  // ����ֵ'��' �����ڱ���������  

end;

procedure  TCompile.F_SYS_FF_2(const N:integer); //���ֺ���2

  function  GetEDXFstp(const i0:integer):string;
  var
    i :integer;
  begin
    i:=i0+N*8*SYS_EFLength;   //�����ػ���(����Ƕ)
    {$ifdef FloatType_Extended}
    result:=('DBBA');                           //fstp  tbyte ptr  [edx+i]
    {$else}
      {$ifdef FloatType_Single}
      result:=('D99A');                         //fstp  dword ptr  [edx+i]
      {$else}
      result:=('DD9A');                         //fstp  qword ptr  [edx+i]
      {$endif}
    {$endif}
    result:=result+inttohex(byte(i Mod 256),2);
    result:=result+inttohex(byte((i Div 256) Mod 256),2);
    result:=result+inttohex(byte((i Div (256*256)) Mod 256),2);
    result:=result+inttohex(byte((i Div (256*256*256)) Mod 256),2);
  end;

  function  GetEDXFld(const i0:integer):string;
  var
    i :integer;
  begin
    i:=i0+N*8*SYS_EFLength;   //�����ػ���(����Ƕ)
    {$ifdef FloatType_Extended}
    result:=('dbAA');  //fld  tbyte ptr [edx+i]
    {$else}
      {$ifdef FloatType_Single}
      result:=('D982');  //fld  dword ptr [edx+i]
      {$else}
      result:=('DD82');  //fld  qword ptr [edx+i]
      {$endif}
    {$endif}
    result:=result+inttohex(byte(i Mod 256),2);
    result:=result+inttohex(byte((i Div 256) Mod 256),2);
    result:=result+inttohex(byte((i Div (256*256)) Mod 256),2);
    result:=result+inttohex(byte((i Div (256*256*256)) Mod 256),2);
  end;

begin
  //( (a) TCmSYS_FF_0 (b) TCmSYS_FF_1 (N) TCmSYS_FF_2 ( g(x) ) )
  //��ʱ g(x) -> st
  //�ж��Ƿ���Ҫ���ص� TCmSYS_FF_1 ��Լ���ĵ�ַ
  //

  CompileOutP();  //[ecx] -> st , old st -> st(1)  //����ֵ'��'
  ExeAddressCodeIn('d9c9');     //fxch  st(1)    //st <-> st(1)
  ExeAddressCodeIn('ddd9');     //fstp st(1)     //st -> st(1),pop    //g(x)=h  (��)

  ExeAddressCodeIn(GetEDXFld(6*SYS_EFLength)); //  fld       tByte  ptr  [edx+6*SYS_EFLength]  // Sum
  ExeAddressCodeIn('dec1'); //  faddp     st(1),st
  ExeAddressCodeIn(GetEDXFstp(6*SYS_EFLength)); //  fstp      tByte ptr [edx+6*SYS_EFLength]  // Sum:=sum+h


  {$ifdef FloatType_Extended}
  ExeAddressCodeIn('db2B');  //fld  tbyte ptr [ebx]
  {$else}
    {$ifdef FloatType_Single}
    ExeAddressCodeIn('D903');  //fld  dword ptr [ebx]
    {$else}
    ExeAddressCodeIn('DD03');  //fld  qword ptr [ebx]
    {$endif}
  {$endif}
  ExeAddressCodeIn(GetEDXFld(5*SYS_EFLength));//  fld     tByte ptr [edx+5*SYS_EFLength]  //dx
  ExeAddressCodeIn('dec1');//  faddp   st(1),st
    {$ifdef FloatType_Extended}
    ExeAddressCodeIn('DB3B');                           //fstp  tbyte ptr  [ebx]
    {$else}
      {$ifdef FloatType_Single}
      ExeAddressCodeIn('D91B');                         //fstp  dword ptr  [ebx]
      {$else}
      ExeAddressCodeIn('DD1B');                         //fstp  qword ptr  [ebx]
      {$endif}
    {$endif}

  ExeAddressCodeIn(GetEDXFld(7*SYS_EFLength)); //  fld       tByte ptr  [edx+7*SYS_EFLength]  // i
  ExeAddressCodeIn('d9e8'); //  fld1
  ExeAddressCodeIn('dec1'); //  faddp     st(1),st             //i:=i+1;
  ExeAddressCodeIn('ddd1'); //  fst       st(1)
  ExeAddressCodeIn(GetEDXFstp(7*SYS_EFLength)); //  fstp      tByte ptr  [edx+7*SYS_EFLength]  // i+1 -> [edx+7*SYS_EFLength]

  ExeAddressCodeIn(GetEDXFld(4*SYS_EFLength)); //  fld       tByte ptr  [edx+4*SYS_EFLength]  // N
  ExeAddressCodeIn('ded9');   // fcompp
  ExeAddressCodeIn('9b');     // wait
  ExeAddressCodeIn('dfe0');   // fstsw ax
  ExeAddressCodeIn('9e');     // sahf
  ExeAddressCodeIn('7e03');   // jle @else

  ExeAddressCodeIn('58');  //  pop eax
  ExeAddressCodeIn('ffe0');//  jmp eax

  ExeAddressCodeIn('58');// @else: pop     eax
  ExeAddressCodeIn('58');//  pop     eax
  ExeAddressCodeIn('5b');//  pop     ebx
  ExeAddressCodeIn(GetEDXFld(6*SYS_EFLength));//  fld     tByte ptr [edx+6*SYS_EFLength]  // Sum
  ExeAddressCodeIn(GetEDXFld(5*SYS_EFLength));//  fld     tByte ptr [edx+5*SYS_EFLength]  //dx
  ExeAddressCodeIn('dec9');//  fmulp   st(1),st

  
end;                        

Procedure TCompile.FF_Fld_X(const x:TCmxFloat); //����x
var
  PMName  :string;
begin
  //++ 7 byte
  ExeAddressCodeIn('B8');
  PMName:=ParameterListIn(x);
  GetExeAddressCodeInPointerRePm(PMName);
  ExeAddressCodeIn('00000000');
  {$ifdef FloatType_Extended}
  ExeAddressCodeIn('db28');  //fld  tbyte ptr [eax] ,  [eax] -> st
  {$else}
    {$ifdef FloatType_Single}
    ExeAddressCodeIn('D900');  //fld  dword ptr [eax] ,  [eax] -> st
    {$else}
    ExeAddressCodeIn('DD00');  //fld  qword ptr [eax] ,  [eax] -> st
    {$endif}
  {$endif}

end;


//------------------------------------------------------------------------------

//�߼�����
procedure TCompile.FB_AND();
begin
{
    if (x<>0) and (y<>0) then
      t:=1
    else
      t:=0;

    asm
    
            fldz
            fcompp
            fstsw      ax
            sahf
            jz         @else

              fldz
              fcomp
              fstsw      ax
              sahf
              jz         @else

                fld1
                jmp        @end

        @else:
            fldz

        @end:
            fstp     st(1)

    emd;
}

  if not OptimizeStackCall(false) then
    CompileOutP();  //[ecx] -> st , old st -> st(1)

  ExeAddressCodeIn('D9EE');
  ExeAddressCodeIn('DED9');
  ExeAddressCodeIn('9B');
  ExeAddressCodeIn('DFE0');
  ExeAddressCodeIn('9E');
  ExeAddressCodeIn('740E');

    ExeAddressCodeIn('D9EE');
    ExeAddressCodeIn('D8D9');
    ExeAddressCodeIn('9B');
    ExeAddressCodeIn('DFE0');
    ExeAddressCodeIn('9E');
    ExeAddressCodeIn('7404');

      ExeAddressCodeIn('D9E8');
      ExeAddressCodeIn('EB02');

  ExeAddressCodeIn('D9EE');

  ExeAddressCodeIn('DDD9');

end;

procedure TCompile.FB_NOT();
begin
{
    if x<>0 then
      x:=0
    else
      x:=1;



    asm
    
            fldz
            fcompp
            fstsw     ax
            sahf
            jz        @else
              fldz
              jmp       @end
        @else:
            fld1
        @end:

    end;

}

  ExeAddressCodeIn('D9EE');
  ExeAddressCodeIn('DED9');
  ExeAddressCodeIn('9B');
  ExeAddressCodeIn('DFE0');
  ExeAddressCodeIn('9E');
  ExeAddressCodeIn('7404');

    ExeAddressCodeIn('D9EE');
    ExeAddressCodeIn('EB02');

  ExeAddressCodeIn('D9E8');

end;

procedure TCompile.FB_OR();
begin
{
    //if (x<>0) OR (y<>0) then
    //  t:=1
    //else
    //  t:=0;

    if (x=0) AND (y=0) then
      t:=0
    else
      t:=1;

    asm
            fldz
            fcompp
            fstsw      ax
            sahf
            jnz        @else   //

              fldz
              fcomp
              fstsw      ax
              sahf
              jnz        @else   //

                fldz             //
                jmp        @end

        @else:
            fld1                 //

        @end:
            fstp     st(1)

    emd;
}

  if not OptimizeStackCall(false) then
    CompileOutP();  //[ecx] -> st , old st -> st(1)

  ExeAddressCodeIn('D9EE');
  ExeAddressCodeIn('DED9');
  ExeAddressCodeIn('9B');
  ExeAddressCodeIn('DFE0');
  ExeAddressCodeIn('9E');
  ExeAddressCodeIn('750E');   //

    ExeAddressCodeIn('D9EE');
    ExeAddressCodeIn('D8D9');
    ExeAddressCodeIn('9B');
    ExeAddressCodeIn('DFE0');
    ExeAddressCodeIn('9E');
    ExeAddressCodeIn('7504');  //

      ExeAddressCodeIn('D9Ee');//
      ExeAddressCodeIn('EB02');

  ExeAddressCodeIn('D9E8');   //

  ExeAddressCodeIn('DDD9');

end;

procedure TCompile.FB_XOR();
begin
{
    if x<>0 then
      if y=0 then
        t:=1
      else
        t:=0
    elseif y<>0 then
      t:=1
    else
      t:=0;


    asm

            fldz
            fcompp
            fstsw       ax
            sahf
            jnz         @elseif
              fldz
              fcompp
              fstsw       ax
              sahf
              jz          @else
                fld1
                jmp       @end

        @elseif:
            fldz
            fcompp
            fstsw       ax
            sahf
            jnz         @else
              fld1
              jmp         @end

        @else:
            fldz

        @end:

    end;
      
}
                        
  if not OptimizeStackCall(false) then
    CompileOutP();  //[ecx] -> st , old st -> st(1)
  
  ExeAddressCodeIn('D9EE');
  ExeAddressCodeIn('DED9');
  ExeAddressCodeIn('9B');
  ExeAddressCodeIn('DFE0');
  ExeAddressCodeIn('9E');
  ExeAddressCodeIn('750E');

    ExeAddressCodeIn('D9EE');
    ExeAddressCodeIn('DED9');
    ExeAddressCodeIn('9B');
    ExeAddressCodeIn('DFE0');
    ExeAddressCodeIn('9E');
    ExeAddressCodeIn('7412');

      ExeAddressCodeIn('D9E8');
      ExeAddressCodeIn('EB10');

  ExeAddressCodeIn('D9EE');
  ExeAddressCodeIn('DED9');
  ExeAddressCodeIn('9B');
  ExeAddressCodeIn('DFE0');
  ExeAddressCodeIn('9E');
  ExeAddressCodeIn('7504');

    ExeAddressCodeIn('D9E8');
    ExeAddressCodeIn('EB02');

  ExeAddressCodeIn('D9EE');

end;

//��ϵ����
procedure TCompile.FB_EQ;
begin
{
    if x=y then
      t:=true
    else
      t:=false;

    asm
            fcompp
            fstsw      ax
            sahf
            jnz        @else
              fld1
              jmp        @end
         @else:
            fldz
         @end:
    end;
}

  if not OptimizeStackCall(false) then
    CompileOutP();  //[ecx] -> st , old st -> st(1)

  ExeAddressCodeIn('DED9');
  ExeAddressCodeIn('9B');
  ExeAddressCodeIn('DFE0');
  ExeAddressCodeIn('9E');
  ExeAddressCodeIn('7504');

    ExeAddressCodeIn('D9E8');
    ExeAddressCodeIn('EB02');

  ExeAddressCodeIn('D9EE');

end;

procedure TCompile.FB_NE();
begin
{
    if x<>y then
      t:=true
    else
      t:=false;

    asm
            fcompp
            fstsw      ax
            sahf
            jz         @else
              fld1
              jmp        @end
         @else:
            fldz
         @end:
    end;
}

  if not OptimizeStackCall(false) then
    CompileOutP();  //[ecx] -> st , old st -> st(1)

  ExeAddressCodeIn('DED9');
  ExeAddressCodeIn('9B');
  ExeAddressCodeIn('DFE0');
  ExeAddressCodeIn('9E');
  ExeAddressCodeIn('7404');  //

    ExeAddressCodeIn('D9E8');
    ExeAddressCodeIn('EB02');

  ExeAddressCodeIn('D9EE');

end;

procedure TCompile.FB_GT;
begin
{
    if x>y then
      t:=true
    else
      t:=false;

    asm
            fcompp
            fstsw      ax
            sahf
            jbe        @else
              fld1
              jmp        @end
         @else:
            fldz
         @end:
    end;
}

  if not OptimizeStackCall() then
    CompileOutP();  //[ecx] -> st , old st -> st(1)

  ExeAddressCodeIn('DED9');
  ExeAddressCodeIn('9B');
  ExeAddressCodeIn('DFE0');
  ExeAddressCodeIn('9E');
  ExeAddressCodeIn('7604');   //

    ExeAddressCodeIn('D9E8');
    ExeAddressCodeIn('EB02');

  ExeAddressCodeIn('D9EE');

end;

procedure TCompile.FB_LT;
begin
{
    if x<y then
      t:=true
    else
      t:=false;

    asm
            fcompp
            fstsw      ax
            sahf
            jbe        @else
              fld1
              jmp        @end
         @else:
            fldz
         @end:
    end;
}

  if not OptimizeStackCall() then
    CompileOutP();  //[ecx] -> st , old st -> st(1)

  ExeAddressCodeIn('DED9');
  ExeAddressCodeIn('9B');
  ExeAddressCodeIn('DFE0');
  ExeAddressCodeIn('9E');
  ExeAddressCodeIn('7304'); //

    ExeAddressCodeIn('D9E8');
    ExeAddressCodeIn('EB02');

  ExeAddressCodeIn('D9EE');

end;

procedure TCompile.FB_GE;
begin
{
    if x>=y then
      t:=true
    else
      t:=false;

    asm
            fcompp
            fstsw      ax
            sahf
            jb         @else
              fld1
              jmp        @end
         @else:
            fldz
         @end:
    end;
}

  if not OptimizeStackCall() then
    CompileOutP();  //[ecx] -> st , old st -> st(1)

  ExeAddressCodeIn('DED9');
  ExeAddressCodeIn('9B');
  ExeAddressCodeIn('DFE0');
  ExeAddressCodeIn('9E');
  ExeAddressCodeIn('7204');   //

    ExeAddressCodeIn('D9E8');
    ExeAddressCodeIn('EB02');

  ExeAddressCodeIn('D9EE');

end;

procedure TCompile.FB_LE;
begin
{
    if x<=y then
      t:=true
    else
      t:=false;

    asm
            fcompp
            fstsw      ax
            sahf
            jnbe       @else
              fld1
              jmp        @end
         @else:
            fldz
         @end:
    end;
}

  if not OptimizeStackCall() then
    CompileOutP();  //[ecx] -> st , old st -> st(1)

  ExeAddressCodeIn('DED9');
  ExeAddressCodeIn('9B');
  ExeAddressCodeIn('DFE0');
  ExeAddressCodeIn('9E');
  ExeAddressCodeIn('7704');   //

    ExeAddressCodeIn('D9E8');
    ExeAddressCodeIn('EB02');

  ExeAddressCodeIn('D9EE');

end;


//------------------------------------------

procedure TCompile.GetMarkerValue0(const Str:string;const iFirst:integer;var iEnd:integer);
begin
  case Str[iFirst] of
    'a'..'z','A'..'Z','_':
      begin
        if iFirst=length(str) then
          iEnd:=iFirst
        else
          GetMarkerValue1(str,iFirst+1,iEnd);
      end;
    else
      iEnd:=0;
  end;
end;

procedure TCompile.GetMarkerValue1(const Str:string;const iFirst:integer;var iEnd:integer);
begin
  case Str[iFirst] of
    'a'..'z','A'..'Z','0'..'9','_':
      begin
        if iFirst=length(str) then
          iEnd:=ifirst
        else
          GetMarkerValue1(str,iFirst+1,iEnd);
      end;
    else
      iEnd:=iFirst-1;
  end;
end;

procedure  TCompile.GetMarker(const Str:string;const iFirst:integer;var iEnd:integer);
begin
  case Str[iFirst] of
    'a'..'z','A'..'Z','0'..'9','_','(',')':
      GetMarker(str,iFirst+1,iEnd);
    '@','&','#':
      iEnd:=iFirst-1;
    else
      iEnd:=0;
  end;
end;


//------------------------------------------------------------------------------


procedure TCompile.GetFloatValue0(const Str:string;const iFirst:integer;var iEnd:integer);
begin
  case Str[iFirst] of
    '0'..'9':
      GetFloatValue1(Str,iFirst+1,iEnd);
    '.':
      GetFloatValue6(Str,iFirst+1,iEnd);
    else
      iEnd:=0;
  end;
end;

procedure TCompile.GetFloatValue1(const Str:string;const iFirst:integer;var iEnd:integer);
begin
  case Str[iFirst] of
    '0'..'9':
      GetFloatValue1(Str,iFirst+1,iEnd);
    '.':
      GetFloatValue2(Str,iFirst+1,iEnd);
    'E','e'://,'D','d':
      GetFloatValue3(Str,iFirst+1,iEnd);
    else
      iEnd:=iFirst-1;
  end;
end;

procedure TCompile.GetFloatValue6(const Str:string;const iFirst:integer;var iEnd:integer);
begin
  case Str[iFirst] of
    '0'..'9':
      GetFloatValue2(Str,iFirst+1,iEnd);
    else
      iEnd:=0;
  end;
end;

procedure TCompile.GetFloatValue2(const Str:string;const iFirst:integer;var iEnd:integer);
begin
  case Str[iFirst] of
    '0'..'9':
      GetFloatValue2(Str,iFirst+1,iEnd);
    'E','e'://,'D','d':
      GetFloatValue3(Str,iFirst+1,iEnd);
    else
      iEnd:=iFirst-1;
  end;
end;

procedure TCompile.GetFloatValue3(const Str:string;const iFirst:integer;var iEnd:integer);
begin
  case Str[iFirst] of
    '0'..'9':
      GetFloatValue5(Str,iFirst+1,iEnd);
    '+','-':
      GetFloatValue4(Str,iFirst+1,iEnd);
    else
      iEnd:=0;
  end;
end;

procedure TCompile.GetFloatValue4(const Str:string;const iFirst:integer;var iEnd:integer);
begin
  case Str[iFirst] of
    '0'..'9':
      GetFloatValue5(Str,iFirst+1,iEnd);
    else
      iEnd:=0;
  end;
end;

procedure TCompile.GetFloatValue5(const Str:string;const iFirst:integer;var iEnd:integer);
begin
  case Str[iFirst] of
    '0'..'9':
      GetFloatValue5(Str,iFirst+1,iEnd);
    else
      iEnd:=iFirst-1;
  end;
end;


//���� HEXToINT: array[0..255] of integer ��ѯ��
initialization
begin
  SetHEXToINTValue();
end;
//==============================================================================

            {  ��ѧ������̬������TCompile(����ʵ�������ͻ��ֺ���)  ����:��˼��   }

{ ���뵥Ԫ���� }

end.
