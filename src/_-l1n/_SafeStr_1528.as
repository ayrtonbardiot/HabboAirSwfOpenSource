// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-l1n._SafeStr_1528

package _-l1n
{
    import com.sulake.core.utils._SafeStr_24;

    [SecureSWF(rename="true")]
    public class _SafeStr_1528 
    {

        private var _name:String;
        private var _SafeStr_4017:int;
        private var _SafeStr_4512:_SafeStr_24;

        public function _SafeStr_1528(_arg_1:String, _arg_2:int)
        {
            _name = _arg_1;
            _SafeStr_4017 = _arg_2;
            _SafeStr_4512 = new _SafeStr_24();
        }

        public function get name():String
        {
            return (_name);
        }

        public function get target():int
        {
            return (_SafeStr_4017);
        }

        public function get queueTypes():Array
        {
            return (_SafeStr_4512.getKeys());
        }

        public function getQueueSize(_arg_1:String):int
        {
            return (_SafeStr_4512.getValue(_arg_1));
        }

        public function addQueue(_arg_1:String, _arg_2:int):void
        {
            _SafeStr_4512.add(_arg_1, _arg_2);
        }


    }
}//package _-l1n

// _SafeStr_1528 = "_-220" (String#6656, DoABC#3)
// _SafeStr_24 = "_-W1s" (String#8725, DoABC#3)
// _SafeStr_4017 = "_-eB" (String#9298, DoABC#3)
// _SafeStr_4512 = "_-f17" (String#9324, DoABC#3)


