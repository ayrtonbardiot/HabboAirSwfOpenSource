// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-CV.HumanThrowsSnowballAtHumanEventData

package _-CV
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class HumanThrowsSnowballAtHumanEventData extends SnowWarGameEventData 
    {

        private var _SafeStr_7190:int;
        private var _SafeStr_7192:int;
        private var _SafeStr_6248:int;

        public function HumanThrowsSnowballAtHumanEventData(_arg_1:int)
        {
            super(_arg_1);
        }

        public function get humanGameObjectId():int
        {
            return (_SafeStr_7190);
        }

        public function get targetHumanGameObjectId():int
        {
            return (_SafeStr_7192);
        }

        public function get trajectory():int
        {
            return (_SafeStr_6248);
        }

        override public function parse(_arg_1:IMessageDataWrapper):void
        {
            _SafeStr_7190 = _arg_1.readInteger();
            _SafeStr_7192 = _arg_1.readInteger();
            _SafeStr_6248 = _arg_1.readInteger();
        }


    }
}//package _-CV

// _SafeStr_6248 = "_-E1U" (String#7474, DoABC#3)
// _SafeStr_7190 = "_-hy" (String#9512, DoABC#3)
// _SafeStr_7192 = "_-D1C" (String#7419, DoABC#3)


