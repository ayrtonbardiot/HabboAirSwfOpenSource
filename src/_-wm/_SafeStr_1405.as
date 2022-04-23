// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-wm._SafeStr_1405

package _-wm
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1405 implements IMessageParser 
    {

        private var _SafeStr_4579:int;
        private var _SafeStr_5806:String;
        private var _SafeStr_6037:int;
        private var _SafeStr_5974:String;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            this._SafeStr_4579 = _arg_1.readInteger();
            this._SafeStr_5806 = _arg_1.readString();
            this._SafeStr_6037 = _arg_1.readInteger();
            if (_arg_1.bytesAvailable)
            {
                this._SafeStr_5974 = _arg_1.readString();
            };
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

        public function get secondsSinceSent():int
        {
            return (_SafeStr_6037);
        }

        public function get extraData():String
        {
            return (_SafeStr_5974);
        }


    }
}//package _-wm

// _SafeStr_1405 = "_-mr" (String#9842, DoABC#3)
// _SafeStr_4579 = "_-021" (String#6500, DoABC#3)
// _SafeStr_5806 = "_-F1i" (String#7550, DoABC#3)
// _SafeStr_5974 = "_-Wl" (String#8752, DoABC#3)
// _SafeStr_6037 = "_-LW" (String#7977, DoABC#3)


