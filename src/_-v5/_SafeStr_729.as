// by nota

//_-v5._SafeStr_729

package _-v5
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;

    [SecureSWF(rename="true")]
    public class _SafeStr_729 implements IMessageComposer, _SafeStr_13 
    {

        private var _SafeStr_6600:Array = [];

        public function _SafeStr_729(_arg_1:Array)
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
            _SafeStr_6600 = null;
        }

        public function get disposed():Boolean
        {
            return (false);
        }


    }
}//package _-v5

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)
// _SafeStr_729 = "_-x1Y" (String#10530, DoABC#3)


