// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-wm._SafeStr_1112

package _-wm
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1112 implements IMessageParser 
    {

        private var _SafeStr_4579:int;
        private var _SafeStr_5806:String;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            this._SafeStr_4579 = _arg_1.readInteger();
            this._SafeStr_5806 = _arg_1.readString();
            return (true);
        }

        public function get senderId():int
        {
            return (this._SafeStr_4579);
        }

        public function get messageText():String
        {
            return (this._SafeStr_5806);
        }


    }
}//package _-wm

// _SafeStr_1112 = "_-y1" (String#10578, DoABC#3)
// _SafeStr_4579 = "_-021" (String#6500, DoABC#3)
// _SafeStr_5806 = "_-F1i" (String#7550, DoABC#3)


