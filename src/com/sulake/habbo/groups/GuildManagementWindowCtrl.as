// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.groups.GuildManagementWindowCtrl

package com.sulake.habbo.groups
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.groups.badge.BadgeEditorCtrl;
    import _-W1K._SafeStr_1108;
    import com.sulake.core.window.components._SafeStr_3263;
    import _-W1K._SafeStr_1571;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window._SafeStr_3109;
    import _-W1K._SafeStr_1121;
    import com.sulake.core.window.components.ITabContextWindow;
    import com.sulake.core.window.components.ISelectableWindow;
    import _-W1K._SafeStr_1109;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.habbo.window.utils._SafeStr_3114;
    import com.sulake.core.window.components.ITextFieldWindow;
    import _-XO._SafeStr_875;
    import com.sulake.habbo.groups.events.GuildSettingsChangedInManageEvent;
    import _-XO._SafeStr_782;
    import _-XO._SafeStr_946;
    import _-XO._SafeStr_850;
    import _-XO._SafeStr_245;
    import com.sulake.core.window.components._SafeStr_3269;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.widgets._SafeStr_3349;

    public class GuildManagementWindowCtrl implements _SafeStr_13 
    {

        private static const VIEW_IDENTITY:int = 1;
        private static const VIEW_BADGE:int = 2;
        private static const VIEW_COLORS:int = 3;
        private static const VIEW_CONFIRM:int = 4;
        private static const VIEW_SETTINGS:int = 5;
        private static const _SafeStr_8617:int = 43;
        private static const _SafeStr_8618:int = 69;
        private static const EDIT_HEADER_TEXTS_OFFSET:int = -20;
        private static const CREATE_HEADER_BITMAP_OFFSET:int = 36;
        private static const STEP_TITLE_Y_OFFSET_ACTIVE:int = 5;
        private static const STEP_TITLE_Y_OFFSET_INACTIVE:int = 9;
        private static const STEP_TITLE_CREDIT_Y_OFFSET_ACTIVE:int = 6;
        private static const STEP_TITLE_CREDIT_Y_OFFSET_INACTIVE:int = 10;
        private static const MAX_DESCRIPTION_LENGTH:int = 0xFF;
        private static const MAX_NAME_LENGTH:int = 30;

        private var _SafeStr_4144:HabboGroupsManager;
        private var _window:_SafeStr_3133;
        private var _SafeStr_5282:BadgeEditorCtrl;
        private var _SafeStr_5283:ColorGridCtrl;
        private var _SafeStr_5284:ColorGridCtrl;
        private var _SafeStr_5285:_SafeStr_3282;
        private var _SafeStr_5287:Boolean = false;
        private var _SafeStr_5288:int = 0;
        private var _SafeStr_3740:_SafeStr_1108;
        private var _SafeStr_5286:int = 1;

        public function GuildManagementWindowCtrl(_arg_1:HabboGroupsManager)
        {
            _SafeStr_4144 = _arg_1;
            _SafeStr_5282 = new BadgeEditorCtrl(_SafeStr_4144);
            _SafeStr_5283 = new ColorGridCtrl(_SafeStr_4144, onPrimaryColorSelected);
            _SafeStr_5284 = new ColorGridCtrl(_SafeStr_4144, onSecondaryColorSelected);
            _SafeStr_5285 = new _SafeStr_3282();
        }

        public function dispose():void
        {
            _SafeStr_4144 = null;
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
            if (_SafeStr_5282)
            {
                _SafeStr_5282.dispose();
                _SafeStr_5282 = null;
            };
            if (_SafeStr_5283)
            {
                _SafeStr_5283.dispose();
                _SafeStr_5283 = null;
            };
            if (_SafeStr_5284)
            {
                _SafeStr_5284.dispose();
                _SafeStr_5284 = null;
            };
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4144 == null);
        }

        private function prepare():void
        {
            if (_window != null)
            {
                return;
            };
            _window = _SafeStr_3263(_SafeStr_4144.getXmlWindow("group_management_window"));
            _window.findChildByTag("close").procedure = onCloseWindow;
            _window.center();
            _window.findChildByName("create_room_link_region").procedure = onCreateRoomLink;
            _window.findChildByName("cancel_link_region").procedure = onCancelLink;
            _window.findChildByName("next_step_button").procedure = onNextStep;
            _window.findChildByName("previous_step_link_region").procedure = onPreviousStep;
            _window.findChildByName("buy_button").procedure = onBuy;
            _window.findChildByName("vip_required_region").procedure = onGetVip;
            _window.addEventListener("WE_DEACTIVATED", onWindowUnActivated);
            _window.findChildByName("edit_tab_1").procedure = onTab;
            _window.findChildByName("edit_tab_2").procedure = onTab;
            _window.findChildByName("edit_tab_3").procedure = onTab;
            _window.findChildByName("edit_tab_5").procedure = onTab;
            _window.findChildByName("reset_badge").procedure = onBadgeReset;
            _window.findChildByName("reset_colors").procedure = onColorReset;
            _window.findChildByName("step_1_members_region").procedure = onMembersClick;
            _SafeStr_5285.prepare(_window);
        }

        public function onFlatCreated(_arg_1:int, _arg_2:String):void
        {
            if (((((!(_window == null)) && (_window.visible)) && (!(_SafeStr_3740 == null))) && (!(_SafeStr_3740.exists))))
            {
                _SafeStr_3740.ownedRooms.splice(0, 0, new _SafeStr_1571(_arg_1, _arg_2, false));
                prepareRoomSelection();
                this.getBaseDropMenu().selection = 0;
            };
        }

        public function onSubscriptionChange():void
        {
            if ((((((!(_window == null)) && (_window.visible)) && (!(_SafeStr_3740 == null))) && (!(_SafeStr_3740.exists))) && (_SafeStr_5286 == 4)))
            {
                refresh();
            };
        }

        public function refresh():void
        {
            var _local_2:int;
            var _local_1:* = null;
            prepare();
            var _local_3:Boolean = ((!(_SafeStr_3740.exists)) || (_SafeStr_3740.isOwner));
            _window.findChildByName("edit_tab_1").visible = _local_3;
            _window.findChildByName("edit_tab_2").visible = _local_3;
            _window.findChildByName("edit_tab_3").visible = _local_3;
            _window.findChildByName("edit_tab_5").visible = _local_3;
            _local_2 = 1;
            while (_local_2 <= 5)
            {
                getStepContainer(_local_2).visible = (_SafeStr_5286 == _local_2);
                _local_1 = _window.findChildByName(("header_pic_bitmap_step_" + _local_2));
                _local_1.y = ((_SafeStr_3740.exists) ? 0 : 36);
                _local_1.visible = (_SafeStr_5286 == _local_2);
                _local_2++;
            };
            _window.findChildByName("header_caption_txt").caption = getStepCaption();
            _window.findChildByName("header_desc_txt").caption = getStepDesc();
            _window.findChildByName("header_pic_bitmap");
            _window.findChildByName("header_caption_txt").y = (43 + getHeaderTextOffset());
            _window.findChildByName("header_desc_txt").y = (69 + getHeaderTextOffset());
            _window.findChildByName("edit_guild_tab_context").visible = _SafeStr_3740.exists;
            _window.findChildByName("footer_cont").visible = (!(_SafeStr_3740.exists));
            _window.findChildByName("reset_badge").visible = false;
            _window.findChildByName("reset_colors").visible = false;
            if (_SafeStr_5286 == 2)
            {
                if (!_SafeStr_3740.exists)
                {
                    _SafeStr_4144.trackGoogle("groupPurchase", "step2_badge");
                };
                if (!_SafeStr_5282.isIntialized)
                {
                    _SafeStr_5282.createWindow(getStepContainer(2), _SafeStr_3740.badgeSettings);
                    _SafeStr_5282.resetLayerOptions(_SafeStr_3740.badgeSettings);
                };
                _window.findChildByName("reset_badge").visible = _SafeStr_3740.exists;
            };
            if (_SafeStr_5286 == 3)
            {
                if (!_SafeStr_3740.exists)
                {
                    _SafeStr_4144.trackGoogle("groupPurchase", "step3_colors");
                };
                if (!_SafeStr_5283.isInitialized)
                {
                    _SafeStr_5283.createAndAttach(getStepContainer(3), "guild_primary_color_selector", _SafeStr_4144.guildEditorData.guildPrimaryColors);
                    if (_SafeStr_3740.exists)
                    {
                        _SafeStr_5283.setSelectedColorById(_SafeStr_3740.primaryColorId);
                    }
                    else
                    {
                        _SafeStr_5283.setSelectedColorById(_SafeStr_4144.guildEditorData.findMatchingPrimaryColorId(_SafeStr_5282.primaryColorIndex));
                    };
                };
                if (!_SafeStr_5284.isInitialized)
                {
                    _SafeStr_5284.createAndAttach(getStepContainer(3), "guild_secondary_color_selector", _SafeStr_4144.guildEditorData.guildSecondaryColors);
                    if (_SafeStr_3740.exists)
                    {
                        _SafeStr_5284.setSelectedColorById(_SafeStr_3740.secondaryColorId);
                    }
                    else
                    {
                        _SafeStr_5284.setSelectedColorById(_SafeStr_4144.guildEditorData.findMatchingSecondaryColorId(_SafeStr_5282.secondaryColorIndex));
                    };
                };
                _window.findChildByName("reset_colors").visible = _SafeStr_3740.exists;
            };
            if (_SafeStr_5286 == 5)
            {
                if (!_SafeStr_5285.isInitialized)
                {
                    _SafeStr_5285.refresh(_SafeStr_3740);
                };
            };
            if (_SafeStr_5286 == 4)
            {
                if (!_SafeStr_3740.exists)
                {
                    _SafeStr_4144.trackGoogle("groupPurchase", "step4_confirm");
                };
                updateConfirmPreview();
            };
            if (_SafeStr_5286 == 1)
            {
                if (!_SafeStr_3740.exists)
                {
                    _SafeStr_4144.trackGoogle("groupPurchase", "step1_identity");
                }
                else
                {
                    _SafeStr_4144.windowManager.registerLocalizationParameter("group.membercount", "totalMembers", ("" + _SafeStr_3740.membershipCount));
                    _window.findChildByName("step_1_members_txt").caption = _SafeStr_4144.localization.getLocalization("group.membercount");
                };
                _window.findChildByName("base_label").visible = (!(_SafeStr_3740.exists));
                _window.findChildByName("base_dropmenu").visible = (!(_SafeStr_3740.exists));
                _window.findChildByName("base_warning").visible = (!(_SafeStr_3740.exists));
                _window.findChildByName("create_room_link_region").visible = (!(_SafeStr_3740.exists));
                _window.findChildByName("step_1_members_region").visible = data.exists;
            };
            refreshCreateHeader();
        }

        private function updateConfirmPreview():void
        {
            var _local_1:* = null;
            var _local_5:* = null;
            var _local_2:* = null;
            var _local_4:* = null;
            var _local_6:* = null;
            var _local_3:* = null;
            if (((_SafeStr_4144.guildEditorData == null) || (_window == null)))
            {
                return;
            };
            if (_SafeStr_5282.isIntialized)
            {
                _local_1 = _SafeStr_5282.getBadgeBitmap();
                _local_5 = (_window.findChildByName("badge_preview_image") as _SafeStr_3264);
                if (((!(_local_1 == null)) && (!(_local_5 == null))))
                {
                    _local_5.bitmap = _local_1;
                };
            };
            if (_SafeStr_5283.isInitialized)
            {
                _local_2 = _SafeStr_5283.getSelectedColorData();
                _local_4 = _window.findChildByName("badge_preview_primary_color_top");
                if (((!(_local_2 == null)) && (!(_local_4 == null))))
                {
                    _local_4.color = _local_2.color;
                };
            };
            if (_SafeStr_5284.isInitialized)
            {
                _local_6 = _SafeStr_5284.getSelectedColorData();
                _local_3 = _window.findChildByName("badge_preview_secondary_color_top");
                if (((!(_local_6 == null)) && (!(_local_3 == null))))
                {
                    _local_3.color = _local_6.color;
                };
            };
            if (_SafeStr_4144.hasVip)
            {
                _window.findChildByName("buy_button").enable();
                _window.findChildByName("buy_border").color = 0xFFC300;
            }
            else
            {
                _window.findChildByName("buy_border").color = 0xAAAAAA;
                _window.findChildByName("buy_button").disable();
            };
            _window.findChildByName("vip_required_border").visible = (!(_SafeStr_4144.hasVip));
            _window.findChildByName("confirmation_caption").caption = ITextWindow(_window.findChildByName("name_txt")).text;
        }

        private function getHeaderTextOffset():int
        {
            return ((_SafeStr_3740.exists) ? -20 : 0);
        }

        private function refreshCreateHeader():void
        {
            var _local_1:int;
            _window.findChildByName("steps_header_cont").visible = (!(_SafeStr_3740.exists));
            if (_SafeStr_3740.exists)
            {
                return;
            };
            _window.findChildByName("next_step_button").visible = hasNextStep();
            _window.findChildByName("previous_step_link_region").visible = hasPreviousStep();
            _window.findChildByName("cancel_link_region").visible = (!(hasPreviousStep()));
            _window.findChildByName("buy_border").visible = (!(hasNextStep()));
            _local_1 = 1;
            while (_local_1 <= 4)
            {
                getStepHeader(_local_1, false).visible = (!(_local_1 == _SafeStr_5286));
                getStepHeader(_local_1, true).visible = (_local_1 == _SafeStr_5286);
                _window.findChildByName(("step_title_" + _local_1)).y = ((_local_1 == _SafeStr_5286) ? 5 : 9);
                _local_1++;
            };
            _window.findChildByName("gcreate_icon_credit").y = ((_SafeStr_5286 == 4) ? 6 : 10);
        }

        private function getStepHeader(_arg_1:int, _arg_2:Boolean):_SafeStr_3109
        {
            return (_window.findChildByName(((("gcreate_" + _arg_1) + "_") + ((_arg_2) ? "1" : "0"))));
        }

        private function getStepContainer(_arg_1:int):_SafeStr_3133
        {
            return (_SafeStr_3133(_window.findChildByName(("step_cont_" + _arg_1))));
        }

        private function getStepCaption():String
        {
            var _local_1:String = (((_SafeStr_3740.exists) ? "group.edit.tabcaption." : "group.create.stepcaption.") + _SafeStr_5286);
            return (_SafeStr_4144.localization.getLocalization(_local_1, _local_1));
        }

        private function getStepDesc():String
        {
            var _local_1:String = (((_SafeStr_3740.exists) ? "group.edit.tabdesc." : "group.create.stepdesc.") + _SafeStr_5286);
            return (_SafeStr_4144.localization.getLocalization(_local_1, _local_1));
        }

        public function onGuildCreationInfo(_arg_1:_SafeStr_1121):void
        {
            _SafeStr_3740 = _arg_1;
            _SafeStr_5286 = 1;
            _SafeStr_5288 = 0;
            refresh();
            refreshBadgeImage();
            setupInputs();
            _SafeStr_4144.localization.registerParameter("group.create.confirm.buyinfo", "amount", ("" + _arg_1.costInCredits));
            _window.visible = true;
            _window.activate();
        }

        public function onGuildEditInfo(_arg_1:_SafeStr_1109):void
        {
            _SafeStr_3740 = _arg_1;
            _SafeStr_5286 = 1;
            _SafeStr_5288 = 0;
            refresh();
            refreshBadgeImage();
            setupInputs();
            var _local_2:ITabContextWindow = ITabContextWindow(_window.findChildByName("edit_guild_tab_context"));
            var _local_3:ISelectableWindow = ISelectableWindow(_window.findChildByName(("edit_tab_" + _SafeStr_5286)));
            _local_2.selector.setSelected(_local_3);
            _window.visible = true;
            _window.activate();
        }

        private function setupInputs():void
        {
            ITextWindow(_window.findChildByName("name_txt")).text = _SafeStr_3740.groupName;
            ITextWindow(_window.findChildByName("desc_txt")).text = _SafeStr_3740.groupDesc;
            prepareRoomSelection();
            _SafeStr_5282.resetLayerOptions(_SafeStr_3740.badgeSettings);
            _SafeStr_5283.setSelectedColorById(_SafeStr_3740.primaryColorId);
            _SafeStr_5284.setSelectedColorById(_SafeStr_3740.secondaryColorId);
            _SafeStr_5285.refresh(_SafeStr_3740);
        }

        private function onTab(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (((!(_arg_1.type == "WE_SELECT")) || (_arg_2.id == _SafeStr_5286)))
            {
                return;
            };
            if (!validateView())
            {
                _arg_1.preventDefault();
                return;
            };
            saveView();
            _SafeStr_5286 = _arg_2.id;
            refresh();
        }

        private function onColorReset(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                if (_SafeStr_5283.isInitialized)
                {
                    _SafeStr_5283.setSelectedColorById(_SafeStr_3740.primaryColorId);
                };
                if (_SafeStr_5284.isInitialized)
                {
                    _SafeStr_5284.setSelectedColorById(_SafeStr_3740.secondaryColorId);
                };
            };
        }

        private function onBadgeReset(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (((_arg_1.type == "WME_CLICK") && (_SafeStr_5282.isIntialized)))
            {
                _SafeStr_5282.resetLayerOptions(_SafeStr_3740.badgeSettings);
            };
        }

        private function onMembersClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if ((((_arg_1.type == "WME_CLICK") && (_SafeStr_3740.exists)) && (!(_SafeStr_4144.guildMembersWindowCtrl == null))))
            {
                _SafeStr_4144.trackGoogle("groupManagement", "groupMembers");
                _SafeStr_4144.guildMembersWindowCtrl.onMembersClick(_SafeStr_3740.groupId, 0);
            };
        }

        private function onCancelLink(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            close();
        }

        private function onCreateRoomLink(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _SafeStr_4144.navigator.startRoomCreation();
        }

        private function onNextStep(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            if (!validateView())
            {
                return;
            };
            _SafeStr_5286 = limitStep((_SafeStr_5286 + 1));
            refresh();
        }

        private function onPreviousStep(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            if (!validateView())
            {
                return;
            };
            _SafeStr_5286 = limitStep((_SafeStr_5286 - 1));
            refresh();
        }

        private function onBuy(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            if (!_SafeStr_3740.exists)
            {
                _SafeStr_4144.trackGoogle("groupPurchase", "buyGroup");
            };
            sendCreateGuildMessage();
        }

        private function onGetVip(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            if (!_SafeStr_3740.exists)
            {
                _SafeStr_4144.trackGoogle("groupPurchase", "buyVip");
            };
            _SafeStr_4144.openVipPurchase("GuildManagementWindowCtrl");
        }

        private function showAlert(_arg_1:String, _arg_2:String):void
        {
            if (!_SafeStr_5287)
            {
                _SafeStr_5287 = true;
                _SafeStr_4144.windowManager.alert(_arg_1, _arg_2, 0, onAlertClose);
            };
        }

        private function onAlertClose(_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
        {
            _arg_1.dispose();
            _SafeStr_5287 = false;
        }

        private function validateView():Boolean
        {
            var _local_2:* = null;
            var _local_3:* = null;
            var _local_4:* = null;
            var _local_1:* = null;
            switch (_SafeStr_5286)
            {
                case 1:
                    _local_2 = ITextFieldWindow(_window.findChildByName("name_txt")).text;
                    if (!_SafeStr_3740.exists)
                    {
                        _local_3 = resolveBaseRoom();
                        if (((((_local_2 == null) || (_local_2.length == 0)) || (_local_3 == null)) || (_local_3.roomId == 0)))
                        {
                            showAlert("${group.edit.error.title}", "${group.edit.error.no.name.or.room.selected}");
                            return (false);
                        };
                        if (((_local_3.hasControllers) && (!(_SafeStr_5288 == _local_3.roomId))))
                        {
                            _SafeStr_5288 = _local_3.roomId;
                            showAlert("${group.edit.error.warning}", "${group.edit.error.controllers}");
                            return (false);
                        };
                    };
                    if (_local_2.length >= 30)
                    {
                        showAlert("${group.edit.error.title}", "${group.edit.error.name.length}");
                        return (false);
                    };
                    _local_4 = ITextFieldWindow(_window.findChildByName("desc_txt")).text;
                    if (((!(_local_4 == null)) && (_local_4.length >= 0xFF)))
                    {
                        showAlert("${group.edit.error.title}", "${group.edit.error.desc.length}");
                        return (false);
                    };
                    return (true);
                case 2:
                    _local_1 = ((_SafeStr_5282.isIntialized) ? _SafeStr_5282.getBadgeSettings() : _SafeStr_3740.badgeSettings);
                    _SafeStr_5282.onViewChange();
                    return (true);
                case 3:
                    if (((_SafeStr_5283.getSelectedColorData() == null) || (_SafeStr_5284.getSelectedColorData() == null)))
                    {
                        showAlert("${group.edit.error.title}", "${group.edit.error.no.color.selected}");
                        return (false);
                    };
                    return (true);
                default:
                    return (true);
            };
        }

        private function saveView():void
        {
            var _local_3:* = null;
            var _local_5:* = null;
            var _local_1:* = null;
            var _local_2:int;
            var _local_4:int;
            switch (_SafeStr_5286)
            {
                case 1:
                    _local_3 = ITextFieldWindow(_window.findChildByName("name_txt")).text;
                    _local_5 = ITextFieldWindow(_window.findChildByName("desc_txt")).text;
                    _SafeStr_4144.send(new _SafeStr_875(_SafeStr_3740.groupId, _local_3, _local_5));
                    _SafeStr_4144.events.dispatchEvent(new GuildSettingsChangedInManageEvent("GSCIME_GUILD_VISUAL_SETTINGS_CHANGED", _SafeStr_3740.groupId));
                    return;
                case 2:
                    _local_1 = ((_SafeStr_5282.isIntialized) ? _SafeStr_5282.getBadgeSettings() : _SafeStr_3740.badgeSettings);
                    _SafeStr_4144.send(new _SafeStr_782(_SafeStr_3740.groupId, _local_1));
                    _SafeStr_4144.events.dispatchEvent(new GuildSettingsChangedInManageEvent("GSCIME_GUILD_VISUAL_SETTINGS_CHANGED", _SafeStr_3740.groupId));
                    return;
                case 3:
                    _local_2 = ((_SafeStr_5283.isInitialized) ? _SafeStr_5283.getSelectedColorId() : _SafeStr_3740.primaryColorId);
                    _local_4 = ((_SafeStr_5284.isInitialized) ? _SafeStr_5284.getSelectedColorId() : _SafeStr_3740.secondaryColorId);
                    _SafeStr_4144.send(new _SafeStr_946(_SafeStr_3740.groupId, _local_2, _local_4));
                    _SafeStr_4144.events.dispatchEvent(new GuildSettingsChangedInManageEvent("GSCIME_GUILD_VISUAL_SETTINGS_CHANGED", _SafeStr_3740.groupId));
                    return;
                case 5:
                    _SafeStr_4144.send(new _SafeStr_850(_SafeStr_3740.groupId, _SafeStr_5285.guildType, _SafeStr_5285.rightsLevel));
                    _SafeStr_5285.resetModified();
                default:
            };
        }

        private function sendCreateGuildMessage():void
        {
            var _local_3:String = ITextFieldWindow(_window.findChildByName("name_txt")).text;
            var _local_5:String = ITextFieldWindow(_window.findChildByName("desc_txt")).text;
            var _local_6:_SafeStr_1571 = resolveBaseRoom();
            var _local_1:Array = ((_SafeStr_5282.isIntialized) ? _SafeStr_5282.getBadgeSettings() : _SafeStr_3740.badgeSettings);
            var _local_2:int = ((_SafeStr_5283.isInitialized) ? _SafeStr_5283.getSelectedColorId() : _SafeStr_3740.primaryColorId);
            var _local_4:int = ((_SafeStr_5284.isInitialized) ? _SafeStr_5284.getSelectedColorId() : _SafeStr_3740.secondaryColorId);
            _SafeStr_5288 = 0;
            _SafeStr_4144.send(new _SafeStr_245(_local_3, _local_5, _local_6.roomId, _local_2, _local_4, _local_1));
        }

        private function hasPreviousStep():Boolean
        {
            return (!(_SafeStr_5286 == limitStep((_SafeStr_5286 - 1))));
        }

        private function hasNextStep():Boolean
        {
            return (!(_SafeStr_5286 == limitStep((_SafeStr_5286 + 1))));
        }

        private function limitStep(_arg_1:int):int
        {
            return (Math.max(1, Math.min(_arg_1, 4)));
        }

        private function getBaseDropMenu():_SafeStr_3269
        {
            return (_SafeStr_3269(_window.findChildByName("base_dropmenu")));
        }

        private function prepareRoomSelection():void
        {
            var _local_2:int;
            var _local_4:* = null;
            var _local_1:_SafeStr_3269 = getBaseDropMenu();
            var _local_3:Array = [];
            var _local_5:int;
            _local_3.push(_SafeStr_4144.localization.getLocalization("group.edit.base.select.room", "group.edit.base.select.room"));
            _local_2 = 0;
            while (_local_2 < _SafeStr_3740.ownedRooms.length)
            {
                _local_4 = _SafeStr_3740.ownedRooms[_local_2];
                _local_3.push(_local_4.roomName);
                if (_local_4.roomId == _SafeStr_3740.baseRoomId)
                {
                    _local_5 = (_local_2 + 1);
                };
                _local_2++;
            };
            _local_1.populate(_local_3);
            if (_local_3.length > 0)
            {
                _local_1.selection = _local_5;
            };
        }

        private function resolveBaseRoom():_SafeStr_1571
        {
            var _local_1:_SafeStr_3269 = _SafeStr_3269(_window.findChildByName("base_dropmenu"));
            var _local_2:int = (_local_1.selection - 1);
            if ((((_local_2 >= 0) && (_local_2 < _SafeStr_3740.ownedRooms.length)) && (!(_SafeStr_3740.ownedRooms[_local_2] == null))))
            {
                return (_SafeStr_1571(_SafeStr_3740.ownedRooms[_local_2]));
            };
            return (null);
        }

        private function onCloseWindow(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            if (_SafeStr_3740.exists)
            {
                if (!validateView())
                {
                    return;
                };
                saveView();
            };
            close();
        }

        public function close():void
        {
            if (_window != null)
            {
                _window.visible = false;
            };
        }

        public function onPrimaryColorSelected(_arg_1:ColorGridCtrl):void
        {
            var _local_3:* = null;
            var _local_2:_SafeStr_3109 = _window.findChildByName("guild_color_primary_color_top");
            if (((((!(_local_2 == null)) && (!(_SafeStr_4144.guildEditorData == null))) && (_arg_1.selectedColorIndex >= 0)) && (_arg_1.selectedColorIndex <= _SafeStr_4144.guildEditorData.guildPrimaryColors.length)))
            {
                _local_3 = _SafeStr_4144.guildEditorData.guildPrimaryColors[_arg_1.selectedColorIndex];
                _local_2.color = _local_3.color;
            };
        }

        public function onSecondaryColorSelected(_arg_1:ColorGridCtrl):void
        {
            var _local_3:* = null;
            var _local_2:_SafeStr_3109 = _window.findChildByName("guild_color_secondary_color_top");
            if ((((!(_SafeStr_4144.guildEditorData == null)) && (_arg_1.selectedColorIndex >= 0)) && (_arg_1.selectedColorIndex <= _SafeStr_4144.guildEditorData.guildSecondaryColors.length)))
            {
                _local_3 = _SafeStr_4144.guildEditorData.guildSecondaryColors[_arg_1.selectedColorIndex];
                _local_2.color = _local_3.color;
            };
        }

        public function get data():_SafeStr_1108
        {
            return (_SafeStr_3740);
        }

        private function refreshBadgeImage():void
        {
            var _local_2:_SafeStr_3109 = _window.findChildByName("step_1_badge");
            var _local_1:_SafeStr_3349 = (_SafeStr_3199(_window.findChildByName("group_logo")).widget as _SafeStr_3349);
            if (((_local_1 == null) || (_local_2 == null)))
            {
                return;
            };
            if (!_SafeStr_3740.exists)
            {
                _local_2.visible = false;
                _local_2.invalidate();
            }
            else
            {
                _local_1.badgeId = _SafeStr_3740.badgeCode;
                _local_1.groupId = _SafeStr_3740.groupId;
                _local_2.visible = true;
                _local_2.invalidate();
            };
        }

        private function onWindowUnActivated(_arg_1:_SafeStr_3116):void
        {
            if (((((!(_SafeStr_3740 == null)) && (_SafeStr_3740.exists)) && (!(_window == null))) && (_window.visible)))
            {
                saveView();
            };
        }


    }
}//package com.sulake.habbo.groups

// _SafeStr_1108 = "_-32v" (String#19381, DoABC#4)
// _SafeStr_1109 = "_-81H" (String#29603, DoABC#4)
// _SafeStr_1121 = "_-C1Z" (String#29371, DoABC#4)
// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1571 = "_-r1" (String#4597, DoABC#4)
// _SafeStr_1581 = "_-A1O" (String#5922, DoABC#4)
// _SafeStr_245 = "_-gN" (String#29731, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3114 = "_-b1E" (String#1258, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3269 = "_-g14" (String#723, DoABC#4)
// _SafeStr_3282 = "_-dq" (String#13668, DoABC#4)
// _SafeStr_3349 = "_-c1x" (String#1353, DoABC#4)
// _SafeStr_3740 = "_-vf" (String#93, DoABC#4)
// _SafeStr_4144 = "_-n1T" (String#228, DoABC#4)
// _SafeStr_5282 = "_-d14" (String#3356, DoABC#4)
// _SafeStr_5283 = "_-S0" (String#3675, DoABC#4)
// _SafeStr_5284 = "_-GM" (String#3716, DoABC#4)
// _SafeStr_5285 = "_-OT" (String#7058, DoABC#4)
// _SafeStr_5286 = "_-UX" (String#2441, DoABC#4)
// _SafeStr_5287 = "_-y1Z" (String#13020, DoABC#4)
// _SafeStr_5288 = "_-vQ" (String#7347, DoABC#4)
// _SafeStr_782 = "_-n11" (String#29652, DoABC#4)
// _SafeStr_850 = "_-3J" (String#29195, DoABC#4)
// _SafeStr_8617 = "_-R1u" (String#41495, DoABC#4)
// _SafeStr_8618 = "_-21N" (String#34274, DoABC#4)
// _SafeStr_875 = "_-WP" (String#29281, DoABC#4)
// _SafeStr_946 = "_-91a" (String#30633, DoABC#4)


