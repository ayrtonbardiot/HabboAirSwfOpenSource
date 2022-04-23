// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-XO._SafeStr_197

package _-XO
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_197 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_197(_arg_1:int, _arg_2:Boolean)
        {
            _SafeStr_3740.push(_arg_1);
            _SafeStr_3740.push(_arg_2);
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
}//package _-XO

// _SafeStr_197 = "_-G1o" (String#7609, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


