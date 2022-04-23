// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-wm._SafeStr_1203

package _-wm
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1203 implements IMessageParser 
    {

        private var _SafeStr_7742:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7742 = _arg_1.readInteger();
            return (true);
        }

        public function get unreadMessageCount():int
        {
            return (_SafeStr_7742);
        }


    }
}//package _-wm

// _SafeStr_1203 = "_-Qh" (String#8329, DoABC#3)
// _SafeStr_7742 = "_-t1W" (String#10254, DoABC#3)


