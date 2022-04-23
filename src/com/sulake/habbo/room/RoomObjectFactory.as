// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.RoomObjectFactory

package com.sulake.habbo.room
{
    import com.sulake.core.runtime._SafeStr_20;
    import com.sulake.room.IRoomObjectFactory;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.habbo.room.object.logic.furniture._SafeStr_3108;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureMultiStateLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureMultiHeightLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurniturePlaceholderLogic;
    import com.sulake.habbo.room.object.logic.AvatarLogic;
    import com.sulake.habbo.room.object.logic.PetLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureRandomStateLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureCreditLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureStickieLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureExternalImageLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurniturePresentLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureTrophyLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureEcotronBoxLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureDiceLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureHockeyScoreLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureHabboWheelLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureOneWayDoorLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurniturePlanetSystemLogic;
    import com.sulake.habbo.room.object.logic.furniture._SafeStr_3193;
    import com.sulake.habbo.room.object.logic.furniture._SafeStr_3117;
    import com.sulake.habbo.room.object.logic.room.RoomTileCursorLogic;
    import com.sulake.habbo.room.object.logic.room._SafeStr_3207;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureSoundMachineLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureJukeboxLogic;
    import com.sulake.habbo.room.object.logic.furniture._SafeStr_3159;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureSongDiskLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurniturePushableLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureClothingChangeLogic;
    import com.sulake.habbo.room.object.logic.furniture._SafeStr_3246;
    import com.sulake.habbo.room.object.logic.furniture._SafeStr_3258;
    import com.sulake.habbo.room.object.logic.furniture._SafeStr_3228;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureFireworksLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureRoomBillboardLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureRoomBackgroundLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureWelcomeGiftLogic;
    import com.sulake.habbo.room.object.logic.furniture._SafeStr_3236;
    import com.sulake.habbo.room.object.logic.room.RoomLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureMannequinLogic;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureGuildCustomizedLogic;
    import com.sulake.habbo.room.object.logic.furniture._SafeStr_3165;
    import com.sulake.habbo.room.object.logic.furniture.FurniturePetProductLogic;
    import com.sulake.habbo.room.object.logic.game.SnowballLogic;
    import com.sulake.habbo.room.object.logic.game._SafeStr_3156;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureCuckooClockLogic;
    import com.sulake.habbo.room.object.logic.furniture._SafeStr_3237;
    import com.sulake.habbo.room.object.logic.furniture._SafeStr_3220;
    import com.sulake.habbo.room.object.logic.furniture._SafeStr_3206;
    import com.sulake.habbo.room.object.logic.furniture._SafeStr_3210;
    import com.sulake.habbo.room.object.logic.furniture._SafeStr_3194;
    import com.sulake.habbo.room.object.logic.furniture._SafeStr_3145;
    import com.sulake.habbo.room.object.logic.furniture._SafeStr_3213;
    import com.sulake.habbo.room.object.logic.furniture._SafeStr_3153;
    import com.sulake.habbo.room.object.logic.furniture._SafeStr_3152;
    import com.sulake.habbo.room.object.logic.furniture.FurnitureMysteryTrophyLogic;
    import com.sulake.habbo.room.object.logic.furniture._SafeStr_3167;
    import com.sulake.habbo.room.object.logic.furniture._SafeStr_3219;
    import com.sulake.habbo.room.object.logic.furniture._SafeStr_3175;
    import com.sulake.habbo.room.object.logic.furniture._SafeStr_3265;
    import com.sulake.habbo.room.object.logic.furniture._SafeStr_3166;
    import com.sulake.habbo.room.object.logic.furniture._SafeStr_3190;
    import com.sulake.habbo.room.object.logic.furniture._SafeStr_3201;
    import com.sulake.habbo.room.object.logic.furniture._SafeStr_3124;
    import com.sulake.habbo.room.object.logic.furniture._SafeStr_3157;
    import com.sulake.habbo.room.object.logic.furniture._SafeStr_3192;
    import com.sulake.habbo.room.object.logic.furniture._SafeStr_3261;
    import com.sulake.habbo.room.object.logic.furniture._SafeStr_3255;
    import com.sulake.habbo.room.object.logic.furniture._SafeStr_3253;
    import com.sulake.habbo.room.object.logic.furniture._SafeStr_3217;
    import com.sulake.habbo.room.object.logic.furniture._SafeStr_3224;
    import com.sulake.room.object.logic.IRoomObjectEventHandler;
    import com.sulake.room.RoomObjectManager;
    import com.sulake.room.IRoomObjectManager;

    public class RoomObjectFactory extends _SafeStr_20 implements IRoomObjectFactory 
    {

        private var _SafeStr_3787:_SafeStr_24 = new _SafeStr_24();
        private var _SafeStr_3786:_SafeStr_24 = new _SafeStr_24();
        private var _objectEventListeners:Array = [];

        public function RoomObjectFactory(_arg_1:_SafeStr_31, _arg_2:uint=0)
        {
            super(_arg_1, _arg_2);
        }

        public function addObjectEventListener(_arg_1:Function):void
        {
            var _local_2:* = null;
            if (_objectEventListeners.indexOf(_arg_1) < 0)
            {
                _objectEventListeners.push(_arg_1);
                if (_arg_1 != null)
                {
                    for each (_local_2 in _SafeStr_3786.getKeys())
                    {
                        events.addEventListener(_local_2, _arg_1);
                    };
                };
            };
        }

        public function removeObjectEventListener(_arg_1:Function):void
        {
            var _local_3:* = null;
            var _local_2:int = _objectEventListeners.indexOf(_arg_1);
            if (_local_2 >= 0)
            {
                _objectEventListeners.splice(_local_2, 1);
                if (_arg_1 != null)
                {
                    for each (_local_3 in _SafeStr_3786.getKeys())
                    {
                        events.removeEventListener(_local_3, _arg_1);
                    };
                };
            };
        }

        private function addTrackedEventType(_arg_1:String):void
        {
            if (_SafeStr_3786.getValue(_arg_1) == null)
            {
                _SafeStr_3786.add(_arg_1, true);
                for each (var _local_2:Function in _objectEventListeners)
                {
                    if (_local_2 != null)
                    {
                        events.addEventListener(_arg_1, _local_2);
                    };
                };
            };
        }

        public function createRoomObjectLogic(_arg_1:String):IRoomObjectEventHandler
        {
            var _local_6:* = null;
            var _local_2:* = null;
            var _local_3:Class;
            switch (_arg_1)
            {
                case "furniture_basic":
                    _local_3 = _SafeStr_3108;
                    break;
                case "furniture_multistate":
                    _local_3 = FurnitureMultiStateLogic;
                    break;
                case "furniture_multiheight":
                    _local_3 = FurnitureMultiHeightLogic;
                    break;
                case "furniture_placeholder":
                    _local_3 = FurniturePlaceholderLogic;
                    break;
                case "user":
                case "bot":
                case "rentable_bot":
                    _local_3 = AvatarLogic;
                    break;
                case "pet":
                    _local_3 = PetLogic;
                    break;
                case "furniture_randomstate":
                    _local_3 = FurnitureRandomStateLogic;
                    break;
                case "furniture_credit":
                    _local_3 = FurnitureCreditLogic;
                    break;
                case "furniture_stickie":
                    _local_3 = FurnitureStickieLogic;
                    break;
                case "furniture_external_image_wallitem":
                    _local_3 = FurnitureExternalImageLogic;
                    break;
                case "furniture_present":
                    _local_3 = FurniturePresentLogic;
                    break;
                case "furniture_trophy":
                    _local_3 = FurnitureTrophyLogic;
                    break;
                case "furniture_ecotron_box":
                    _local_3 = FurnitureEcotronBoxLogic;
                    break;
                case "furniture_dice":
                    _local_3 = FurnitureDiceLogic;
                    break;
                case "furniture_hockey_score":
                    _local_3 = FurnitureHockeyScoreLogic;
                    break;
                case "furniture_habbowheel":
                    _local_3 = FurnitureHabboWheelLogic;
                    break;
                case "furniture_one_way_door":
                    _local_3 = FurnitureOneWayDoorLogic;
                    break;
                case "furniture_planet_system":
                    _local_3 = FurniturePlanetSystemLogic;
                    break;
                case "furniture_window":
                    _local_3 = _SafeStr_3193;
                    break;
                case "furniture_roomdimmer":
                    _local_3 = _SafeStr_3117;
                    break;
                case "tile_cursor":
                    _local_3 = RoomTileCursorLogic;
                    break;
                case "selection_arrow":
                    _local_3 = _SafeStr_3207;
                    break;
                case "furniture_sound_machine":
                    _local_3 = FurnitureSoundMachineLogic;
                    break;
                case "furniture_jukebox":
                    _local_3 = FurnitureJukeboxLogic;
                    break;
                case "furniture_crackable":
                    _local_3 = _SafeStr_3159;
                    break;
                case "furniture_song_disk":
                    _local_3 = FurnitureSongDiskLogic;
                    break;
                case "furniture_pushable":
                    _local_3 = FurniturePushableLogic;
                    break;
                case "furniture_clothing_change":
                    _local_3 = FurnitureClothingChangeLogic;
                    break;
                case "furniture_counter_clock":
                    _local_3 = _SafeStr_3246;
                    break;
                case "furniture_score":
                    _local_3 = _SafeStr_3258;
                    break;
                case "furniture_es":
                    _local_3 = _SafeStr_3228;
                    break;
                case "furniture_fireworks":
                    _local_3 = FurnitureFireworksLogic;
                    break;
                case "furniture_bb":
                    _local_3 = FurnitureRoomBillboardLogic;
                    break;
                case "furniture_bg":
                    _local_3 = FurnitureRoomBackgroundLogic;
                    break;
                case "furniture_welcome_gift":
                    _local_3 = FurnitureWelcomeGiftLogic;
                    break;
                case "furniture_floor_hole":
                    _local_3 = _SafeStr_3236;
                    break;
                case "room":
                    _local_3 = RoomLogic;
                    break;
                case "furniture_mannequin":
                    _local_3 = FurnitureMannequinLogic;
                    break;
                case "furniture_guild_customized":
                    _local_3 = FurnitureGuildCustomizedLogic;
                    break;
                case "furniture_group_forum_terminal":
                    _local_3 = _SafeStr_3165;
                    break;
                case "furniture_pet_customization":
                    _local_3 = FurniturePetProductLogic;
                    break;
                case "game_snowball":
                    _local_3 = SnowballLogic;
                    break;
                case "game_snowsplash":
                    _local_3 = _SafeStr_3156;
                    break;
                case "furniture_cuckoo_clock":
                    _local_3 = FurnitureCuckooClockLogic;
                    break;
                case "furniture_vote_counter":
                    _local_3 = _SafeStr_3237;
                    break;
                case "furniture_vote_majority":
                    _local_3 = _SafeStr_3220;
                    break;
                case "furniture_soundblock":
                    _local_3 = _SafeStr_3206;
                    break;
                case "furniture_random_teleport":
                    _local_3 = _SafeStr_3210;
                    break;
                case "furniture_monsterplant_seed":
                    _local_3 = _SafeStr_3194;
                    break;
                case "furniture_purchasable_clothing":
                    _local_3 = _SafeStr_3145;
                    break;
                case "furniture_background_color":
                    _local_3 = _SafeStr_3213;
                    break;
                case "furniture_mysterybox":
                    _local_3 = _SafeStr_3153;
                    break;
                case "furniture_effectbox":
                    _local_3 = _SafeStr_3152;
                    break;
                case "furniture_mysterytrophy":
                    _local_3 = FurnitureMysteryTrophyLogic;
                    break;
                case "furniture_achievement_resolution":
                    _local_3 = _SafeStr_3167;
                    break;
                case "furniture_lovelock":
                    _local_3 = _SafeStr_3219;
                    break;
                case "furniture_wildwest_wanted":
                    _local_3 = _SafeStr_3175;
                    break;
                case "furniture_hween_lovelock":
                    _local_3 = _SafeStr_3265;
                    break;
                case "furniture_badge_display":
                    _local_3 = _SafeStr_3166;
                    break;
                case "furniture_high_score":
                    _local_3 = _SafeStr_3190;
                    break;
                case "furniture_internal_link":
                    _local_3 = _SafeStr_3201;
                    break;
                case "furniture_editable_internal_link":
                    _local_3 = _SafeStr_3124;
                    break;
                case "furniture_editable_room_link":
                    _local_3 = _SafeStr_3157;
                    break;
                case "furniture_custom_stack_height":
                    _local_3 = _SafeStr_3192;
                    break;
                case "furniture_youtube":
                    _local_3 = _SafeStr_3261;
                    break;
                case "furniture_rentable_space":
                    _local_3 = _SafeStr_3255;
                    break;
                case "furniture_change_state_when_step_on":
                    _local_3 = _SafeStr_3253;
                    break;
                case "furniture_vimeo":
                    _local_3 = _SafeStr_3217;
                    break;
                case "furniture_crafting_gizmo":
                    _local_3 = _SafeStr_3224;
            };
            if (_local_3 == null)
            {
                return (null);
            };
            var _local_4:Object = new (_local_3)();
            if ((_local_4 is IRoomObjectEventHandler))
            {
                _local_6 = (_local_4 as IRoomObjectEventHandler);
                _local_6.eventDispatcher = this.events;
                if (_SafeStr_3787.getValue(_arg_1) == null)
                {
                    _SafeStr_3787.add(_arg_1, true);
                    _local_2 = _local_6.getEventTypes();
                    for each (var _local_5:String in _local_2)
                    {
                        addTrackedEventType(_local_5);
                    };
                };
                return (_local_6);
            };
            return (null);
        }

        public function createRoomObjectManager():IRoomObjectManager
        {
            return (new RoomObjectManager());
        }


    }
}//package com.sulake.habbo.room

// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_3108 = "_-32g" (String#980, DoABC#4)
// _SafeStr_3117 = "_-x17" (String#20441, DoABC#4)
// _SafeStr_3124 = "_-J1g" (String#22215, DoABC#4)
// _SafeStr_3145 = "_-t19" (String#18743, DoABC#4)
// _SafeStr_3152 = "_-a1M" (String#17290, DoABC#4)
// _SafeStr_3153 = "_-zV" (String#18538, DoABC#4)
// _SafeStr_3156 = "_-PW" (String#18680, DoABC#4)
// _SafeStr_3157 = "_-V1G" (String#21796, DoABC#4)
// _SafeStr_3159 = "_-WQ" (String#19173, DoABC#4)
// _SafeStr_3165 = "_-pB" (String#17884, DoABC#4)
// _SafeStr_3166 = "_-LT" (String#13477, DoABC#4)
// _SafeStr_3167 = "_-T1F" (String#21825, DoABC#4)
// _SafeStr_3175 = "_-Z18" (String#17704, DoABC#4)
// _SafeStr_3190 = "_-g16" (String#15889, DoABC#4)
// _SafeStr_3192 = "_-81I" (String#19790, DoABC#4)
// _SafeStr_3193 = "_-bn" (String#19014, DoABC#4)
// _SafeStr_3194 = "_-B1a" (String#18178, DoABC#4)
// _SafeStr_3201 = "_-P1W" (String#21106, DoABC#4)
// _SafeStr_3206 = "_-mS" (String#18187, DoABC#4)
// _SafeStr_3207 = "_-v1v" (String#20349, DoABC#4)
// _SafeStr_3210 = "_-E13" (String#19068, DoABC#4)
// _SafeStr_3213 = "_-I1O" (String#18655, DoABC#4)
// _SafeStr_3217 = "_-H1n" (String#22458, DoABC#4)
// _SafeStr_3219 = "_-qE" (String#17934, DoABC#4)
// _SafeStr_3220 = "_-02h" (String#20244, DoABC#4)
// _SafeStr_3224 = "_-lw" (String#18201, DoABC#4)
// _SafeStr_3228 = "_-s1N" (String#18430, DoABC#4)
// _SafeStr_3236 = "_-m1u" (String#21720, DoABC#4)
// _SafeStr_3237 = "_-n1u" (String#20846, DoABC#4)
// _SafeStr_3246 = "_-p1J" (String#22877, DoABC#4)
// _SafeStr_3253 = "_-4C" (String#22307, DoABC#4)
// _SafeStr_3255 = "_-i1G" (String#16570, DoABC#4)
// _SafeStr_3258 = "_-ga" (String#18090, DoABC#4)
// _SafeStr_3261 = "_-v6" (String#17957, DoABC#4)
// _SafeStr_3265 = "_-41h" (String#20584, DoABC#4)
// _SafeStr_3786 = "_-y6" (String#10797, DoABC#4)
// _SafeStr_3787 = "_-i1u" (String#14113, DoABC#4)


