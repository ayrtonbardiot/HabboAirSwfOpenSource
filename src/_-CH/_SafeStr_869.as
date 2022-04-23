// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-CH._SafeStr_869

package _-CH
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;

    [SecureSWF(rename="true")]
    public class _SafeStr_869 implements IMessageComposer, _SafeStr_13 
    {

        public static const _SafeStr_7176:int = 1;
        public static const _SafeStr_7177:int = 2;

        private var _SafeStr_6600:Array = [];

        public function _SafeStr_869(_arg_1:int, _arg_2:int, _arg_3:int)
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
}//package _-CH

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)
// _SafeStr_7176 = "_-iu" (String#9575, DoABC#3)
// _SafeStr_7177 = "_-M6" (String#8022, DoABC#3)
// _SafeStr_869 = "_-81M" (String#7077, DoABC#3)


