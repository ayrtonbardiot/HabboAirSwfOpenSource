// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-CV.CreateSnowballEventData

package _-CV
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CreateSnowballEventData extends SnowWarGameEventData 
    {

        private var _SafeStr_7189:int;
        private var _SafeStr_7190:int;
        private var _SafeStr_6637:int;
        private var _SafeStr_6638:int;
        private var _SafeStr_6248:int;

        public function CreateSnowballEventData(_arg_1:int)
        {
            super(_arg_1);
        }

        public function get snowBallGameObjectId():int
        {
            return (_SafeStr_7189);
        }

        public function get humanGameObjectId():int
        {
            return (_SafeStr_7190);
        }

        public function get targetX():int
        {
            return (_SafeStr_6637);
        }

        public function get targetY():int
        {
            return (_SafeStr_6638);
        }

        public function get trajectory():int
        {
            return (_SafeStr_6248);
        }

        override public function parse(_arg_1:IMessageDataWrapper):void
        {
            _SafeStr_7189 = _arg_1.readInteger();
            _SafeStr_7190 = _arg_1.readInteger();
            _SafeStr_6637 = _arg_1.readInteger();
            _SafeStr_6638 = _arg_1.readInteger();
            _SafeStr_6248 = _arg_1.readInteger();
        }


    }
}//package _-CV

// _SafeStr_6248 = "_-E1U" (String#7474, DoABC#3)
// _SafeStr_6637 = "_-K11" (String#7861, DoABC#3)
// _SafeStr_6638 = "_-kM" (String#9701, DoABC#3)
// _SafeStr_7189 = "_-8" (String#7065, DoABC#3)
// _SafeStr_7190 = "_-hy" (String#9512, DoABC#3)


