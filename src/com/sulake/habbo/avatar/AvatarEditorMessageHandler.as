// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.AvatarEditorMessageHandler

package com.sulake.habbo.avatar
{
    import com.sulake.habbo.communication._SafeStr_25;
    import _-w19._SafeStr_317;
    import _-O1Z._SafeStr_860;
    import _-w19._SafeStr_1038;
    import _-w19._SafeStr_228;
    import _-a1N._SafeStr_322;
    import _-a1N._SafeStr_685;
    import _-yL._SafeStr_142;
    import _-w19._SafeStr_242;
    import _-s3._SafeStr_502;
    import _-s3._SafeStr_237;
    import com.sulake.habbo.avatar.view.AvatarEditorNameChangeView;
    import _-MB._SafeStr_1092;
    import _-a1N._SafeStr_331;
    import _-s3._SafeStr_751;
    import com.sulake.core.communication.messages.IMessageEvent;

    public class AvatarEditorMessageHandler 
    {

        private var _communication:_SafeStr_25;
        private var _SafeStr_4360:HabboAvatarEditorManager;

        public function AvatarEditorMessageHandler(_arg_1:HabboAvatarEditorManager, _arg_2:_SafeStr_25)
        {
            _SafeStr_4360 = _arg_1;
            _communication = _arg_2;
            _communication.addHabboConnectionMessageEvent(new _SafeStr_317(onAvatarEffectExpired));
            _communication.addHabboConnectionMessageEvent(new _SafeStr_860(onRoomAvatarEffects));
            _communication.addHabboConnectionMessageEvent(new _SafeStr_1038(onAvatarEffectActivated));
            _communication.addHabboConnectionMessageEvent(new _SafeStr_228(onAvatarEffectSelected));
            _communication.addHabboConnectionMessageEvent(new _SafeStr_322(onWardrobe));
            _communication.addHabboConnectionMessageEvent(new _SafeStr_685(onCheckUserNameResult));
            _communication.addHabboConnectionMessageEvent(new _SafeStr_142(onUserRights));
            _communication.addHabboConnectionMessageEvent(new _SafeStr_242(onAvatarEffectAdded));
        }

        public function dispose():void
        {
            _communication = null;
            _SafeStr_4360 = null;
        }

        public function saveWardrobeOutfit(_arg_1:int, _arg_2:IOutfit):void
        {
            if (_communication == null)
            {
                return;
            };
            var _local_3:_SafeStr_502 = new _SafeStr_502(_arg_1, _arg_2.figure, _arg_2.gender);
            _communication.connection.send(_local_3);
            _local_3.dispose();
            _local_3 = null;
        }

        public function checkName(_arg_1:String):void
        {
            if (_communication == null)
            {
                return;
            };
            _communication.connection.send(new _SafeStr_237(_arg_1));
        }

        private function onCheckUserNameResult(_arg_1:_SafeStr_685):void
        {
            if (((_arg_1 == null) || (!(_SafeStr_4360))))
            {
                return;
            };
            var _local_3:HabboAvatarEditor = _SafeStr_4360.getEditor(0);
            if (_local_3 == null)
            {
                return;
            };
            var _local_2:AvatarEditorNameChangeView = _local_3.view.avatarEditorNameChangeView;
            if (_local_2 == null)
            {
                return;
            };
            var _local_4:_SafeStr_1092 = _arg_1.getParser();
            if (_local_4.resultCode == _SafeStr_331._SafeStr_3821)
            {
                _local_2.checkedName = _local_4.name;
            }
            else
            {
                _local_2.setNameNotAvailableView(_local_4.resultCode, _local_4.name, _local_4.nameSuggestions);
            };
        }

        public function getWardrobe():void
        {
            if (_communication == null)
            {
                return;
            };
            var _local_1:_SafeStr_751 = new _SafeStr_751();
            _communication.connection.send(_local_1);
            _local_1.dispose();
            _local_1 = null;
        }

        private function onWardrobe(_arg_1:_SafeStr_322):void
        {
            if (((_arg_1 == null) || (!(_SafeStr_4360))))
            {
                return;
            };
            var _local_2:HabboAvatarEditor = _SafeStr_4360.getEditor(0);
            if (_local_2)
            {
                _local_2.wardrobe.updateSlots(_arg_1.state, _arg_1.outfits);
            };
        }

        private function onUserRights(_arg_1:_SafeStr_142):void
        {
            if (((_arg_1 == null) || (!(_SafeStr_4360))))
            {
                return;
            };
            var _local_2:HabboAvatarEditor = _SafeStr_4360.getEditor(0);
            if (_local_2)
            {
                _local_2.clubMemberLevel = ((_arg_1.clubLevel != 0) ? 2 : 0);
                _local_2.update();
            };
        }

        private function onAvatarEffectAdded(_arg_1:IMessageEvent):void
        {
            if (((_arg_1 == null) || (!(_SafeStr_4360))))
            {
                return;
            };
            var _local_2:HabboAvatarEditor = _SafeStr_4360.getEditor(0);
            if (_local_2)
            {
                _local_2.effects.reset();
            };
        }

        private function onAvatarEffectActivated(_arg_1:_SafeStr_1038):void
        {
            if (((_arg_1 == null) || (!(_SafeStr_4360))))
            {
                return;
            };
            var _local_2:HabboAvatarEditor = _SafeStr_4360.getEditor(0);
            if (_local_2)
            {
                _local_2.effects.reset();
                _local_2.figureData.avatarEffectType = _arg_1.getParser().type;
                _local_2.figureData.updateView();
            };
        }

        private function onAvatarEffectExpired(_arg_1:_SafeStr_317):void
        {
            var _local_3:int;
            if (((_arg_1 == null) || (!(_SafeStr_4360))))
            {
                return;
            };
            var _local_2:HabboAvatarEditor = _SafeStr_4360.getEditor(0);
            if (_local_2)
            {
                _local_2.effects.reset();
                _local_3 = _arg_1.getParser().type;
                if (_local_2.figureData.avatarEffectType == _local_3)
                {
                    _local_2.figureData.avatarEffectType = -1;
                    _local_2.figureData.updateView();
                };
            };
        }

        private function onRoomAvatarEffects(_arg_1:_SafeStr_860):void
        {
            if (((_arg_1 == null) || (!(_SafeStr_4360))))
            {
                return;
            };
            var _local_2:HabboAvatarEditor = _SafeStr_4360.getEditor(0);
            if ((((_local_2) && (!(_SafeStr_4360.roomDesktop == null))) && (_arg_1.getParser().userId == _SafeStr_4360.roomDesktop.roomSession.ownUserRoomId)))
            {
                _local_2.figureData.avatarEffectType = _arg_1.getParser().effectId;
                _local_2.figureData.updateView();
            };
        }

        private function onAvatarEffectSelected(_arg_1:_SafeStr_317):void
        {
            if (((_arg_1 == null) || (!(_SafeStr_4360))))
            {
                return;
            };
            var _local_2:HabboAvatarEditor = _SafeStr_4360.getEditor(0);
            if (_local_2)
            {
                _local_2.figureData.avatarEffectType = _arg_1.getParser().type;
                _local_2.figureData.updateView();
            };
        }


    }
}//package com.sulake.habbo.avatar

// _SafeStr_1038 = "_-BG" (String#13270, DoABC#4)
// _SafeStr_1092 = "_-Y4" (String#28998, DoABC#4)
// _SafeStr_142 = "_-Fc" (String#3612, DoABC#4)
// _SafeStr_228 = "_-117" (String#31083, DoABC#4)
// _SafeStr_237 = "_-fW" (String#19059, DoABC#4)
// _SafeStr_242 = "_-SW" (String#15763, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_317 = "_-A1D" (String#10436, DoABC#4)
// _SafeStr_322 = "_-1H" (String#24138, DoABC#4)
// _SafeStr_331 = "_-z8" (String#2976, DoABC#4)
// _SafeStr_3821 = "_-5N" (String#22387, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_502 = "_-11v" (String#20696, DoABC#4)
// _SafeStr_685 = "_-U1q" (String#13587, DoABC#4)
// _SafeStr_751 = "_-G1d" (String#19230, DoABC#4)
// _SafeStr_860 = "_-bF" (String#10975, DoABC#4)


