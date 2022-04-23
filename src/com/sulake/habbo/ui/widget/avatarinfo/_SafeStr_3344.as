// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.avatarinfo._SafeStr_3344

package com.sulake.habbo.ui.widget.avatarinfo
{
    import com.sulake.habbo.ui.widget.events.RoomWidgetRentableBotInfoUpdateEvent;
    import _-6L._SafeStr_1630;

    public class _SafeStr_3344 
    {

        private var _SafeStr_3820:int = -1;
        private var _SafeStr_5536:int;
        private var _SafeStr_5868:Boolean = false;
        private var _SafeStr_5869:Boolean = false;
        private var _SafeStr_5871:Boolean = false;
        private var _SafeStr_6092:int = 0;
        private var _botSkills:Array;
        private var _SafeStr_5682:Array = new Array(0);
        private var _name:String;


        public function set id(_arg_1:int):void
        {
            _SafeStr_3820 = _arg_1;
        }

        public function set roomIndex(_arg_1:int):void
        {
            _SafeStr_5536 = _arg_1;
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get roomIndex():int
        {
            return (_SafeStr_5536);
        }

        public function get isIgnored():Boolean
        {
            return (_SafeStr_5868);
        }

        public function get amIOwner():Boolean
        {
            return (_SafeStr_5869);
        }

        public function get amIAnyRoomController():Boolean
        {
            return (_SafeStr_5871);
        }

        public function get carryItemType():int
        {
            return (_SafeStr_6092);
        }

        public function set isIgnored(_arg_1:Boolean):void
        {
            _SafeStr_5868 = _arg_1;
        }

        public function set amIOwner(_arg_1:Boolean):void
        {
            _SafeStr_5869 = _arg_1;
        }

        public function set amIAnyRoomController(_arg_1:Boolean):void
        {
            _SafeStr_5871 = _arg_1;
        }

        public function set carryItemType(_arg_1:int):void
        {
            _SafeStr_6092 = _arg_1;
        }

        public function get botSkills():Array
        {
            return (_botSkills);
        }

        public function set botSkills(_arg_1:Array):void
        {
            _botSkills = _arg_1;
        }

        public function get botSkillsWithCommands():Array
        {
            return (_SafeStr_5682);
        }

        public function set botSkillsWithCommands(_arg_1:Array):void
        {
            _SafeStr_5682 = _arg_1;
        }

        public function get name():String
        {
            return (_name);
        }

        public function populate(_arg_1:RoomWidgetRentableBotInfoUpdateEvent):void
        {
            if (_arg_1.webID != id)
            {
                _SafeStr_5682 = new Array(0);
            };
            id = _arg_1.webID;
            roomIndex = _arg_1.userRoomId;
            amIOwner = _arg_1.amIOwner;
            amIAnyRoomController = _arg_1.amIAnyRoomController;
            carryItemType = _arg_1.carryItem;
            botSkills = _arg_1.botSkills;
            _name = _arg_1.name;
        }

        public function cloneAndSetSkillsWithCommands(_arg_1:Array):void
        {
            _botSkills = [];
            for each (var _local_2:_SafeStr_1630 in _arg_1)
            {
                botSkills.push(_local_2.id);
            };
            _SafeStr_5682 = _arg_1.concat();
        }


    }
}//package com.sulake.habbo.ui.widget.avatarinfo

// _SafeStr_1630 = "_-N1E" (String#30603, DoABC#4)
// _SafeStr_3344 = "_-f1h" (String#7944, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_5536 = "_-517" (String#2777, DoABC#4)
// _SafeStr_5682 = "_-R1v" (String#5397, DoABC#4)
// _SafeStr_5868 = "_-v1J" (String#5256, DoABC#4)
// _SafeStr_5869 = "_-WY" (String#3551, DoABC#4)
// _SafeStr_5871 = "_-Yy" (String#3530, DoABC#4)
// _SafeStr_6092 = "_-D7" (String#7144, DoABC#4)


