// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.game.snowwar.arena.DefaultGameStage

package com.sulake.habbo.game.snowwar.arena
{
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameLevelData;

    public class DefaultGameStage implements _SafeStr_3308 
    {

        protected var _SafeStr_5062:SynchronizedGameArena;
        protected var _SafeStr_5731:GameLevelData;
        private var _SafeStr_4036:Boolean = false;


        public function dispose():void
        {
            _SafeStr_4036 = true;
            _SafeStr_5062 = null;
            _SafeStr_5731 = null;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        public function initialize(_arg_1:SynchronizedGameArena, _arg_2:GameLevelData):void
        {
            _SafeStr_5062 = _arg_1;
            _SafeStr_5731 = _arg_2;
        }

        public function get gameArena():SynchronizedGameArena
        {
            return (_SafeStr_5062);
        }

        public function get gameLevelData():GameLevelData
        {
            return (_SafeStr_5731);
        }

        public function get roomType():String
        {
            return ("");
        }


    }
}//package com.sulake.habbo.game.snowwar.arena

// _SafeStr_3308 = "_-DZ" (String#13313, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_5062 = "_-81r" (String#2028, DoABC#4)
// _SafeStr_5731 = "_-bM" (String#12695, DoABC#4)


