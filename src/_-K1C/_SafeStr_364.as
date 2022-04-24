// by nota

//_-K1C._SafeStr_364

package _-K1C
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import __AS3__.vec.Vector;

    [SecureSWF(rename="true")]
    public class _SafeStr_364 implements IMessageComposer 
    {

        private var _SafeStr_6600:Array = [];

        public function _SafeStr_364(_arg_1:Vector.<int>)
        {
            _SafeStr_6600.push(_arg_1.length);
            for each (var _local_2:int in _arg_1)
            {
                _SafeStr_6600.push(_local_2);
            };
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_6600);
        }

        public function dispose():void
        {
        }


    }
}//package _-K1C

// _SafeStr_364 = "_-r1A" (String#10115, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)


