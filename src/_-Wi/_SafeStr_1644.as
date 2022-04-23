// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Wi._SafeStr_1644

package _-Wi
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1644 
    {

        private var _groupId:int;
        private var _name:String;
        private var _description:String;
        private var _icon:String;
        private var _SafeStr_6275:int;
        private var _SafeStr_7726:int;
        private var _SafeStr_5641:int;
        private var _SafeStr_7727:int;
        private var _SafeStr_7719:int;
        private var _SafeStr_7720:int;
        private var _SafeStr_7721:String;
        private var _SafeStr_7722:int;


        public static function readFromMessage(_arg_1:IMessageDataWrapper):_SafeStr_1644
        {
            return (fillFromMessage(new (_SafeStr_1644)(), _arg_1));
        }

        internal static function fillFromMessage(_arg_1:_SafeStr_1644, _arg_2:IMessageDataWrapper):_SafeStr_1644
        {
            _arg_1._groupId = _arg_2.readInteger();
            _arg_1._name = _arg_2.readString();
            _arg_1._description = _arg_2.readString();
            _arg_1._icon = _arg_2.readString();
            _arg_1._SafeStr_6275 = _arg_2.readInteger();
            _arg_1._SafeStr_7726 = _arg_2.readInteger();
            _arg_1._SafeStr_5641 = _arg_2.readInteger();
            _arg_1._SafeStr_7727 = _arg_2.readInteger();
            _arg_1._SafeStr_7719 = _arg_2.readInteger();
            _arg_1._SafeStr_7720 = _arg_2.readInteger();
            _arg_1._SafeStr_7721 = _arg_2.readString();
            _arg_1._SafeStr_7722 = _arg_2.readInteger();
            return (_arg_1);
        }


        public function get groupId():int
        {
            return (_groupId);
        }

        public function get name():String
        {
            return (_name);
        }

        public function get description():String
        {
            return (_description);
        }

        public function get icon():String
        {
            return (_icon);
        }

        public function get totalThreads():int
        {
            return (_SafeStr_6275);
        }

        public function get leaderboardScore():int
        {
            return (_SafeStr_7726);
        }

        public function get totalMessages():int
        {
            return (_SafeStr_5641);
        }

        public function get unreadMessages():int
        {
            return (_SafeStr_7727);
        }

        public function get lastMessageId():int
        {
            return (_SafeStr_7719);
        }

        public function get lastMessageAuthorId():int
        {
            return (_SafeStr_7720);
        }

        public function get lastMessageAuthorName():String
        {
            return (_SafeStr_7721);
        }

        public function get lastMessageTimeAsSecondsAgo():int
        {
            return (_SafeStr_7722);
        }

        public function updateFrom(_arg_1:_SafeStr_1644):void
        {
            _SafeStr_6275 = _arg_1._SafeStr_6275;
            _SafeStr_5641 = _arg_1._SafeStr_5641;
            _SafeStr_7727 = _arg_1._SafeStr_7727;
            _SafeStr_7720 = _arg_1._SafeStr_7720;
            _SafeStr_7721 = _arg_1._SafeStr_7721;
            _SafeStr_7719 = _arg_1._SafeStr_7719;
            _SafeStr_7722 = _arg_1._SafeStr_7722;
        }

        public function get lastReadMessageId():int
        {
            return (_SafeStr_5641 - _SafeStr_7727);
        }

        public function set lastReadMessageId(_arg_1:int):void
        {
            _SafeStr_7727 = (_SafeStr_5641 - _arg_1);
            if (_SafeStr_7727 < 0)
            {
                _SafeStr_7727 = 0;
            };
        }

        public function addNewThread(_arg_1:_SafeStr_1633):void
        {
            _SafeStr_7720 = _arg_1.lastMessageAuthorId;
            _SafeStr_7721 = _arg_1.lastMessageAuthorName;
            _SafeStr_7719 = _arg_1.lastMessageId;
            _SafeStr_7722 = _arg_1.lastMessageTimeAsSecondsAgo;
            _SafeStr_6275++;
            _SafeStr_5641++;
            _SafeStr_7727 = 0;
        }


    }
}//package _-Wi

// _SafeStr_1633 = "_-XN" (String#8805, DoABC#3)
// _SafeStr_1644 = "_-mW" (String#9832, DoABC#3)
// _SafeStr_5641 = "_-9u" (String#7204, DoABC#3)
// _SafeStr_6275 = "_-n1O" (String#9875, DoABC#3)
// _SafeStr_7719 = "_-Sp" (String#8460, DoABC#3)
// _SafeStr_7720 = "_-Od" (String#8184, DoABC#3)
// _SafeStr_7721 = "_-sc" (String#10227, DoABC#3)
// _SafeStr_7722 = "_-RZ" (String#8379, DoABC#3)
// _SafeStr_7726 = "_-e2" (String#9294, DoABC#3)
// _SafeStr_7727 = "_-G1F" (String#7590, DoABC#3)


