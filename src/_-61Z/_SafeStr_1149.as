// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-61Z._SafeStr_1149

package _-61Z
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1149 implements IMessageParser 
    {

        private var _SafeStr_3820:int;
        private var _SafeStr_7116:int;


        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_3820 = _arg_1.readInteger();
            _SafeStr_7116 = _arg_1.readInteger();
            return (true);
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get itemsLeft():int
        {
            return (_SafeStr_7116);
        }


    }
}//package _-61Z

// _SafeStr_1149 = "_-i1s" (String#9542, DoABC#3)
// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)
// _SafeStr_7116 = "_-oX" (String#9955, DoABC#3)


