// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-M1k._SafeStr_138

package _-M1k
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;

    [SecureSWF(rename="true")]
    public class _SafeStr_138 implements IMessageComposer, _SafeStr_13 
    {

        private var _SafeStr_6600:Array = [];

        public function _SafeStr_138(_arg_1:int, _arg_2:String, _arg_3:String)
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
}//package _-M1k

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_138 = "_-C6" (String#7380, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)


