package thomasuster;
import String;
import haxe.crypto.Md5;
import cpp.vm.Gc;
class UUIDFactory {

    public var seeds:Array<Void->String>;

    public function new():Void {
        seeds = [];
        seeds.push(getMemInfo);
        seeds.push(getMemReserved);
        seeds.push(getMemCurrent);
        seeds.push(getMemLarge);
        seeds.push(secondsMSandPID);
        seeds.push(nanoSeconds);
        seeds.push(rand);
    }

    function getMemInfo():String {
        return Std.string(Gc.memInfo(Gc.MEM_INFO_USAGE));
    }

    function getMemReserved():String {
        return Std.string(Gc.memInfo(Gc.MEM_INFO_RESERVED));
    }

    function getMemCurrent():String {
        return Std.string(Gc.memInfo(Gc.MEM_INFO_CURRENT));
    }

    function getMemLarge():String {
        return Std.string(Gc.memInfo(Gc.MEM_INFO_LARGE));
    }

    function secondsMSandPID():String {
        return Std.string(Sys.time());
    }

    function nanoSeconds():String {
        return Std.string(Sys.cpuTime());
    }

    function rand():String {
        return Std.string(Math.random());
    }

    public function make():String {
        var s:String = '';
        for (i in 0...seeds.length) {
            var seed:Void->String = seeds[i];
            s+=seed();
        }
        var raw:String = Md5.encode(s).toUpperCase();
        return raw.substr(0,8) + '-' + raw.substr(4,4) + '-' + raw.substr(8,4) + '-' + raw.substr(12,4) + '-' + raw.substr(16,12);

    }
}