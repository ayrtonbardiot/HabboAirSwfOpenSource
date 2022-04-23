// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-E1H._SafeStr_1337

package _-E1H
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1337 implements IMessageParser 
    {

        private var _SafeStr_7208:Boolean = true;
        private var _SafeStr_7210:Boolean = false;


        public function isOk():Boolean
        {
            return (_SafeStr_7208);
        }

        public function isRenderLimitHit():Boolean
        {
            return (_SafeStr_7210);
        }

        public function flush():Boolean
        {
            _SafeStr_7208 = true;
            _SafeStr_7210 = false;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            if (_arg_1.bytesAvailable)
            {
                _SafeStr_7208 = _arg_1.readBoolean();
                _SafeStr_7210 = _arg_1.readBoolean();
            };
            return (true);
        }


    }
}//package _-E1H

// _SafeStr_1337 = "_-a1k" (String#8986, DoABC#3)
// _SafeStr_7208 = "_-lb" (String#9778, DoABC#3)
// _SafeStr_7210 = "_-g19" (String#9388, DoABC#3)


