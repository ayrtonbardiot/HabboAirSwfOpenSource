// by nota

//_-CH._SafeStr_126

package _-CH
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;

    [SecureSWF(rename="true")]
    public class _SafeStr_126 implements IMessageComposer, _SafeStr_13 
    {

        private var _SafeStr_6600:Array = [];

        public function _SafeStr_126(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:int)
        {
            _SafeStr_6600.push(_arg_1);
            _SafeStr_6600.push(_arg_2);
            _SafeStr_6600.push(_arg_3);
            _SafeStr_6600.push(_arg_4);
        }

        public function getMessageArray():Array
        {
            return (this._SafeStr_6600);
        }

        public function dispose():void
        {
            this._SafeStr_6600 = null;
        }

        public function get disposed():Boolean
        {
            return (false);
        }


    }
}//package _-CH

// _SafeStr_126 = "_-81V" (String#7083, DoABC#3)
// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)


