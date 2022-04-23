// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-E1H._SafeStr_1271

package _-E1H
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1271 implements IMessageParser 
    {

        private var _SafeStr_7208:Boolean = false;
        private var _SafeStr_7209:String = null;


        public function isOk():Boolean
        {
            return (_SafeStr_7208);
        }

        public function getErrorReason():String
        {
            return (_SafeStr_7209);
        }

        public function flush():Boolean
        {
            _SafeStr_7208 = false;
            _SafeStr_7209 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7208 = _arg_1.readBoolean();
            _SafeStr_7209 = _arg_1.readString();
            return (true);
        }


    }
}//package _-E1H

// _SafeStr_1271 = "_-V1B" (String#8605, DoABC#3)
// _SafeStr_7208 = "_-lb" (String#9778, DoABC#3)
// _SafeStr_7209 = "_-2w" (String#6709, DoABC#3)


