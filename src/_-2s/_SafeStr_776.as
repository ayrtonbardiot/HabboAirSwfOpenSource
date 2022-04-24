// by nota

//_-2s._SafeStr_776

package _-2s
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;

    [SecureSWF(rename="true")]
    public class _SafeStr_776 implements IMessageComposer, _SafeStr_13 
    {

        public static const _SafeStr_7040:int = 0;
        public static const _SafeStr_7041:int = 1;
        public static const _SafeStr_7042:int = 3;
        public static const _SafeStr_7043:int = 4;

        private var _SafeStr_6600:Array = [];

        public function _SafeStr_776(_arg_1:int, _arg_2:String, _arg_3:String)
        {
            this._SafeStr_6600.push(_arg_1);
            this._SafeStr_6600.push(_arg_2);
            this._SafeStr_6600.push(_arg_3);
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
}//package _-2s

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)
// _SafeStr_7040 = "_-H11" (String#7656, DoABC#3)
// _SafeStr_7041 = "_-eP" (String#9305, DoABC#3)
// _SafeStr_7042 = "_-Xq" (String#8819, DoABC#3)
// _SafeStr_7043 = "_-yR" (String#10633, DoABC#3)
// _SafeStr_776 = "_-h1V" (String#9470, DoABC#3)


