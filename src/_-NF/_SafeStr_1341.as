// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-NF._SafeStr_1341

package _-NF
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1341 implements IMessageParser 
    {

        private var _SafeStr_4258:int;
        private var _name:String;

        public function _SafeStr_1341()
        {
            _SafeStr_4258 = -1;
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4258 = _arg_1.readInteger();
            _name = _arg_1.readString();
            return (true);
        }

        public function get result():int
        {
            return (_SafeStr_4258);
        }

        public function get name():String
        {
            return (_name);
        }


    }
}//package _-NF

// _SafeStr_1341 = "_-hE" (String#9490, DoABC#3)
// _SafeStr_4258 = "_-fc" (String#9371, DoABC#3)


