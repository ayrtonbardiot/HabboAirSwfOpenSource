// by nota

//_-2s._SafeStr_253

package _-2s
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;

    [SecureSWF(rename="true")]
    public class _SafeStr_253 implements IMessageComposer, _SafeStr_13 
    {

        public static const _SafeStr_7039:int = -1;

        private var _SafeStr_6600:Array = [];

        public function _SafeStr_253(_arg_1:int, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:Boolean, _arg_6:int)
        {
            this._SafeStr_6600.push(_arg_1);
            this._SafeStr_6600.push(_arg_2);
            this._SafeStr_6600.push(_arg_3);
            this._SafeStr_6600.push(_arg_4);
            this._SafeStr_6600.push(_arg_5);
            if (_arg_6 != -1)
            {
                this._SafeStr_6600.push(_arg_6);
            };
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
// _SafeStr_253 = "_-4m" (String#6863, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)
// _SafeStr_7039 = "_-s1z" (String#10207, DoABC#3)


