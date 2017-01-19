; -- cpudesc.iss --
; restools
; http://restools.hanzify.org
; cpudesc.dll 为一个用于 Inno Setup 的 6 KB 的 CPU 参数检测插件。

[Setup]
AppName=My Program
AppVerName=My Program version 1.5
DefaultDirName={pf}\My Program
DefaultGroupName=My Program
UninstallDisplayIcon=
Compression=lzma
SolidCompression=yes
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: "{#PluginDir}\cpudesc.dll"; Flags: dontcopy

[code]
function cpu_intelp: integer; external 'cpu_intelp@files:cpudesc.dll stdcall';
//Intel CPU 型号:
//  0:    不是 Intel CPU (或者是非常旧的型号).
//  1:    Pentium 或者 Pentium MMX.
//        如果你想知道 CPU 的 MMX 支持, 可以使用 cpu_mmx 函数来检查.
//  2:    Pentium Pro, II 或者 Celeron.
//        (可能有，也可能没有 MMX，使用 cpu_mmx 函数来检查)
//  3:    Pentium III 或者 P3 (旧) Xeon. (带 MMX 和 SSE.)
//  4:    Pentium IV 或者 (新) Xeon. (带 MMX, SSE 和 SSE2.)

function cpu_amd: integer; external 'cpu_amd@files:cpudesc.dll stdcall';
//  第1字母标识为返回值右移8位得到字符(chr(cpu_amd shr 8)), 后数值标志为返回值的最低字节(cpu_amd and $FF)
//  为获得以下格式的返回值, 使用下面的例子中所用算法得出.
//  000:  不是 AMD CPU (或者是非常旧的型号).
//  Kdd:  旧的 K-系列.   "dd" 例如 05 代表 K5 或者 06 代表 K6.
//        (Pentium 兼容.   K5s 无 MMX 或者 3DNOW.   K6s 支持 MMX,
//        及后型号都是基于 3DNOW.)
//  Add:  AMD Athlon 或者 Duron.   "dd" 型号代码 (从 01 到 10).
//        (Pentium II 兼容. 支持扩展 MMX and 扩展 3DNOW. 无 SSE.)
//  Odd:  AMD Opteron.   "dd" 型号代码.
//        (Pentium IV 兼容. 这类 CPU 应该支持这个插件中能够检测到的这些功能.)

function cpu_ppro: integer; external 'cpu_ppro@files:cpudesc.dll stdcall';
//  0:    不兼容 Intel Pentium Pro 处理器.
//  1:    兼容 Intel Pentium Pro 处理器.

function cpu_mmx: integer; external 'cpu_mmx@files:cpudesc.dll stdcall';
//  0:    不支持 MMX.
//  1:    支持标准的 Intel MMX.
//  2:    支持标准的 MMX 和 扩展的 AMD MMX.

function cpu_sse: integer; external 'cpu_sse@files:cpudesc.dll stdcall';
//  0:    不支持 SSE.
//  1:    支持 SSE (Intel's Streaming SIMD extensions, P3-style).

function cpu_sse2: integer; external 'cpu_sse2@files:cpudesc.dll stdcall';
//  0:    不支持 SSE2.
//  1:    支持 SSE2 (Intel's Streaming SIMD extensions 2, P4-style).

function cpu_3dnow: integer; external 'cpu_3dnow@files:cpudesc.dll stdcall';
//  0:    不支持 3DNOW.
//  1:    支持标准的 AMD 3DNOW.
//  2:    支持标准的 AMD 3DNOW 和扩展的 AMD 3DNOW.

function cpu_arch: integer; external 'cpu_arch@files:cpudesc.dll stdcall';
//  00:   32-bit Intel or compatible
//  01:   MIPS (did NT 3.5, apparently)
//  02:   DEC Alpha.   (Yes, DEC.   I can't bring myself to call it COMPAQ.)
//  03:   PowerPC
//  04:   SHX (?)
//  05:   ARM (Acorn Risc Machine, I presume.   Running Windows?)
//  06:   64-bit Intel.
//  07:   64-bit Alpha
//  08:   MSIL (?)
//  09:   64-bit AMD
//  10:   32-bit Intel doing Win64 (?)

function cpu_level: integer; external 'cpu_level@files:cpudesc.dll stdcall';
// "Processor level", like what you see in the main processor environment
//        variable.   Sort-of useless for Intel architecture.

function cpu_ncpu: integer; external 'cpu_ncpu@files:cpudesc.dll stdcall';
//CPU数量 (或者核的数量)

function cpu_mhz: integer; external 'cpu_mhz@files:cpudesc.dll stdcall';
//CPU频率, 单位: MHz (大约数，有些微波动，一般在个位数上波动)

function cpu_ram: integer; external 'cpu_ram@files:cpudesc.dll stdcall';
//物理内存大小, 单位: MB


procedure InitializeWizard();
var
  s: string;
  amd_val: Integer;
  cpu_amd_h, cpu_amd_l: string;
begin
  amd_val := cpu_amd;
  cpu_amd_h := chr(amd_val shr 8);        // 字母标志
  cpu_amd_l := inttostr(cpu_amd and $FF); // 型号
  if length(cpu_amd_l) = 1 then cpu_amd_l := '0' + cpu_amd_l;

  s := 'INTELP=' + inttostr(cpu_intelp) + ' ' +
       'AMD=' + cpu_amd_h + cpu_amd_l + ' ' + // 1个字母 + dd 两位数值
       'PPRO=' + inttostr(cpu_ppro) + ' ' +
       'MMX=' + inttostr(cpu_mmx) + ' ' +
       'SSE=' + inttostr(cpu_sse) + ' ' +
       'SSE2=' + inttostr(cpu_sse2) + ' ' +
       '3DNOW=' + inttostr(cpu_3dnow) + ' ' +
       'ARCH=' + inttostr(cpu_arch) + ' ' +
       'LEVEL=' + inttostr(cpu_level) + ' ' +
       'NCPU=' + inttostr(cpu_ncpu) + ' ' +
       'MHZ=' + inttostr(cpu_mhz) + ' ' +
       'RAM=' + inttostr(cpu_ram);
  msgbox(s, mbInformation, MB_OK);
end;
