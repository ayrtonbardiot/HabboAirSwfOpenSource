// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-IR._SafeStr_154

package _-IR
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_154 implements IMessageComposer 
    {

        private var _SafeStr_7265:int;

        public function _SafeStr_154(_arg_1:int)
        {
            _SafeStr_7265 = _arg_1;
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_7265]);
        }

        public function dispose():void
        {
        }

        public function get disposed():Boolean
        {
            return (true);
        }


    }
}//package _-IR

// _SafeStr_154 = "_-I1B" (String#7717, DoABC#3)
// _SafeStr_7265 = "_-R1o" (String#8355, DoABC#3)


