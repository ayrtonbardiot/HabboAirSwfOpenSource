// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Wi._SafeStr_1157

package _-Wi
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1157 implements IMessageParser 
    {

        private var _SafeStr_5319:int;


        public function get unreadForumsCount():int
        {
            return (_SafeStr_5319);
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_5319 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-Wi

// _SafeStr_1157 = "_-A1R" (String#7223, DoABC#3)
// _SafeStr_5319 = "_-Dh" (String#7454, DoABC#3)


