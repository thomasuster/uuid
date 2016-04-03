package thomasuster;
class TestUUIDEntropy extends haxe.unit.TestCase {

    var factory:UUIDFactory;
    var numIters:Int;

    public override function setup() : Void {
        factory = new UUIDFactory();
        numIters = 100;
    }

    public function testBits() {
        var length:Int = 0;
        for (i in 0...factory.seeds.length) {
            var seed:Void->String = factory.seeds[i];
            length+=seed().length;
        }
        trace(length);
        assertTrue(length >= 128);
    }
}