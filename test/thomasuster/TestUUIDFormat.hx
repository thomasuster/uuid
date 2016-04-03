package thomasuster;
class TestUUIDFormat extends haxe.unit.TestCase {

    var factory:UUIDFactory;

    public override function setup() : Void {
        factory = new UUIDFactory();
    }

    public function testLength() {
        var uuid:String = factory.make();
        assertEquals('C34905D6-413B-4C8D-9ADD-91EC461817D4'.length, uuid.length);
    }

    public function testDashPlacements():Void {
        var uuid:String = factory.make();
        assertEquals(uuid.charAt('C34905D6'.length), '-');
        assertEquals(uuid.charAt('C34905D6-413B'.length), '-');
        assertEquals(uuid.charAt('C34905D6-413B-4C8D'.length), '-');
        assertEquals(uuid.charAt('C34905D6-413B-4C8D-9ADD'.length), '-');
    }

    public function testValidChars():Void {
        var uuid:String = factory.make();
        var reg:EReg = ~/[0-9A-F\-]/;
        for (i in 0...uuid.length) {
            var char:String = uuid.charAt(i);
            if(!reg.match(char))
                assertTrue(false);
        }
        assertTrue(true);
    }
}