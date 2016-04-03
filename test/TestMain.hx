import haxe.unit.TestRunner;
import thomasuster.TestUUIDFormat;
import thomasuster.TestUUIDEntropy;
class TestMain {

    static function main() {
        var runner:TestRunner = new TestRunner();
        runner.add(new TestUUIDFormat());
        runner.add(new TestUUIDEntropy());
        runner.run();
    }

}