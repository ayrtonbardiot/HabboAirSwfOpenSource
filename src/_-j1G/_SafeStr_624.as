// by nota

//_-j1G._SafeStr_624

package _-j1G
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.utils._SafeStr_24;

    [SecureSWF(rename="true")]
    public class _SafeStr_624 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_624(_arg_1:int, _arg_2:_SafeStr_24)
        {
            _SafeStr_3740.push(_arg_1);
            _SafeStr_3740.push((_arg_2.length * 2));
            for each (var _local_3:String in _arg_2.getKeys())
            {
                _SafeStr_3740.push(_local_3);
                _SafeStr_3740.push(_arg_2.getValue(_local_3));
            };
        }

        public function dispose():void
        {
            _SafeStr_3740 = null;
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_3740);
        }


    }
}//package _-j1G

// _SafeStr_24 = "_-W1s" (String#8725, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_624 = "_-I1v" (String#7735, DoABC#3)


