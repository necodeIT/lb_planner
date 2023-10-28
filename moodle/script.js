

const funcs = [{"function_name": "local_lbplanner_user_get_user", "group": "user", "capabilities": "student", "description": "Get the data for a user", "path": "lbplanner/services/user/get_user.php", "parameters": {"userid": {"type": "int", "description": "The id of the user to get the data for", "required": true, "default_value": null, "nullable": false}}, "returns": {"userid": {"type": "int", "description": "The id of the user"}, "username": {"type": "String", "description": "The username of the user"}, "firstname": {"type": "String", "description": "The firstname of the user"}, "lastname": {"type": "String", "description": "The lastname of the user"}, "theme": {"type": "String", "description": "The theme the user has selected"}, "lang": {"type": "String", "description": "The language the user has selected"}, "profileimageurl": {"type": "String", "description": "The url of the profile image"}, "planid": {"type": "int", "description": "The id of the plan the user is assigned to"}, "colorblindness": {"type": "String", "description": "The colorblindness of the user"}, "displaytaskcount": {"type": "int", "description": "The displaytaskcount of the user"}, "capabilities": {"type": "int", "description": "The capability"}, "vintage": {"type": "String", "description": "The vintage of the user"}}, "returns_multiple": false}, {"function_name": "local_lbplanner_user_get_all_users", "group": "user", "capabilities": "student", "description": "Gets all users registered by the lbplanner app", "path": "lbplanner/services/user/get_all_users.php", "parameters": {"userid": {"type": "int", "description": "The id of the user", "required": true, "default_value": null, "nullable": false}}, "returns": {"userid": {"type": "int", "description": "The id of the user"}, "username": {"type": "String", "description": "The username of the user"}, "firstname": {"type": "String", "description": "The firstname of the user"}, "lastname": {"type": "String", "description": "The lastname of the user"}, "profileimageurl": {"type": "String", "description": "The url of the profile image"}, "vintage": {"type": "String", "description": "The vintage of the user"}}, "returns_multiple": true}, {"function_name": "local_lbplanner_user_register_user", "group": "user", "capabilities": "student", "description": "Register a new user in the lbplanner app", "path": "lbplanner/services/user/register_user.php", "parameters": {"userid": {"type": "int", "description": "The id of the user to register", "required": true, "default_value": null, "nullable": false}, "lang": {"type": "String", "description": "The language the user has selected", "required": true, "default_value": null, "nullable": false}, "theme": {"type": "String", "description": "The theme the user has selected", "required": true, "default_value": null, "nullable": false}}, "returns": {"userid": {"type": "int", "description": "The id of the user"}, "username": {"type": "String", "description": "The username of the user"}, "firstname": {"type": "String", "description": "The firstname of the user"}, "lastname": {"type": "String", "description": "The lastname of the user"}, "capabilities": {"type": "int", "description": "The capability"}, "theme": {"type": "String", "description": "The theme the user has selected"}, "lang": {"type": "String", "description": "The language the user has selected"}, "profileimageurl": {"type": "String", "description": "The url of the profile image"}, "planid": {"type": "int", "description": "The id of the plan the user is assigned to"}, "colorblindness": {"type": "String", "description": "The colorblindness of the user"}}, "returns_multiple": false}, {"function_name": "local_lbplanner_user_update_user", "group": "user", "capabilities": "student", "description": "Update the data for a user", "path": "lbplanner/services/user/update_user.php", "parameters": {"userid": {"type": "int", "description": "The id of the user to register", "required": true, "default_value": null, "nullable": false}, "lang": {"type": "String", "description": "The language the user has selected", "required": true, "default_value": null, "nullable": false}, "theme": {"type": "String", "description": "The theme the user has selected", "required": true, "default_value": null, "nullable": false}, "colorblindness": {"type": "String", "description": "The colorblindness the user has selected", "required": true, "default_value": null, "nullable": false}, "displaytaskcount": {"type": "int", "description": "The displaytaskcount the user has selected", "required": true, "default_value": null, "nullable": false}}, "returns": {"userid": {"type": "int", "description": "The id of the user"}, "username": {"type": "String", "description": "The username of the user"}, "firstname": {"type": "String", "description": "The firstname of the user"}, "lastname": {"type": "String", "description": "The lastname of the user"}, "capabilities": {"type": "int", "description": "The role of the user"}, "theme": {"type": "String", "description": "The theme the user has selected"}, "lang": {"type": "String", "description": "The language the user has selected"}, "profileimageurl": {"type": "String", "description": "The url of the profile image"}, "planid": {"type": "int", "description": "The id of the plan the user is assigned to"}, "colorblindness": {"type": "String", "description": "The colorblindness the user has selected"}, "displaytaskcount": {"type": "int", "description": "The displaytaskcount the user has selected"}, "vintage": {"type": "String", "description": "The vintage of the user"}}, "returns_multiple": false}, {"function_name": "local_lbplanner_courses_get_course", "group": "courses", "capabilities": "student", "description": "Get the data for a course", "path": "lbplanner/services/courses/get_course.php", "parameters": {"courseid": {"type": "int", "description": "The id of the course", "required": true, "default_value": null, "nullable": false}, "userid": {"type": "int", "description": "The id of the user", "required": true, "default_value": null, "nullable": false}}, "returns": {"courseid": {"type": "int", "description": "The id of the course"}, "color": {"type": "String", "description": "The color of the course"}, "name": {"type": "String", "description": "The name of the course"}, "shortname": {"type": "String", "description": "The shortname of the course"}, "enabled": {"type": "bool", "description": "Whether the course is enabled or not"}, "userid": {"type": "int", "description": "The id of the user"}}, "returns_multiple": false}, {"function_name": "local_lbplanner_courses_get_all_courses", "group": "courses", "capabilities": "student", "description": "Get all the courses of the current year", "path": "lbplanner/services/courses/get_all_courses.php", "parameters": {"userid": {"type": "int", "description": "The id of the user to get the courses for", "required": true, "default_value": null, "nullable": false}}, "returns": {"courseid": {"type": "int", "description": "The id of the course"}, "color": {"type": "String", "description": "The color of the course"}, "name": {"type": "String", "description": "The name of the course"}, "shortname": {"type": "String", "description": "The shortname of the course"}, "enabled": {"type": "bool", "description": "Whether the course is enabled or not"}, "userid": {"type": "int", "description": "The id of the user"}}, "returns_multiple": true}, {"function_name": "local_lbplanner_courses_update_course", "group": "courses", "capabilities": "student", "description": "Update the data for a course", "path": "lbplanner/services/courses/update_course.php", "parameters": {"courseid": {"type": "int", "description": "The id of the course", "required": true, "default_value": null, "nullable": false}, "color": {"type": "String", "description": "The color of the course", "required": true, "default_value": null, "nullable": false}, "shortname": {"type": "String", "description": "The shortname of the course", "required": true, "default_value": null, "nullable": false}, "enabled": {"type": "bool", "description": "Whether the course is enabled or not", "required": true, "default_value": null, "nullable": false}, "userid": {"type": "int", "description": "The id of the user", "required": true, "default_value": null, "nullable": false}}, "returns": {"courseid": {"type": "int", "description": "The id of the course"}, "color": {"type": "String", "description": "The color of the course"}, "name": {"type": "String", "description": "The name of the course"}, "shortname": {"type": "String", "description": "The shortname of the course"}, "enabled": {"type": "bool", "description": "Whether the course is enabled or not"}, "userid": {"type": "int", "description": "The id of the user"}}, "returns_multiple": false}, {"function_name": "local_lbplanner_modules_get_module", "group": "modules", "capabilities": "student", "description": "Get the data for a module", "path": "lbplanner/services/modules/get_module.php", "parameters": {"moduleid": {"type": "int", "description": "The id of the module", "required": true, "default_value": null, "nullable": false}, "userid": {"type": "int", "description": "The id of the user", "required": true, "default_value": null, "nullable": false}}, "returns": {}, "returns_multiple": false}, {"function_name": "local_lbplanner_modules_get_all_modules", "group": "modules", "capabilities": "student", "description": "Get all the modules of the current year", "path": "lbplanner/services/modules/get_all_modules.php", "parameters": {"userid": {"type": "int", "description": "The id of the user", "required": true, "default_value": null, "nullable": false}}, "returns": {}, "returns_multiple": true}, {"function_name": "local_lbplanner_modules_get_all_course_modules", "group": "modules", "capabilities": "student", "description": "Get all the modules of the given course", "path": "lbplanner/services/modules/get_all_course_modules.php", "parameters": {"courseid": {"type": "int", "description": "The id of the course", "required": true, "default_value": null, "nullable": false}, "userid": {"type": "int", "description": "The id of the user", "required": true, "default_value": null, "nullable": false}, "ekenabled": {"type": "bool", "description": "Whether or not to include ek modules", "required": true, "default_value": "false", "nullable": false}}, "returns": {}, "returns_multiple": true}, {"function_name": "local_lbplanner_plan_clear_plan", "group": "plan", "capabilities": "student", "description": "Clear the plan for the given user", "path": "lbplanner/services/plan/clear_plan.php", "parameters": {"userid": {"type": "int", "description": "The id of the user to get the data for", "required": true, "default_value": null, "nullable": false}, "planid": {"type": "int", "description": "The id of the plan", "required": true, "default_value": null, "nullable": false}}, "returns": {}, "returns_multiple": false}, {"function_name": "local_lbplanner_plan_get_plan", "group": "plan", "capabilities": "student", "description": "Get the plan of the given user", "path": "lbplanner/services/plan/get_plan.php", "parameters": {"userid": {"type": "int", "description": "The id of the user", "required": true, "default_value": null, "nullable": false}}, "returns": {}, "returns_multiple": false}, {"function_name": "local_lbplanner_plan_invite_user", "group": "plan", "capabilities": "student", "description": "Invite a user to the plan", "path": "lbplanner/services/plan/invite_user.php", "parameters": {"inviterid": {"type": "int", "description": "The id of the Owner of the plan", "required": true, "default_value": null, "nullable": false}, "inviteeid": {"type": "int", "description": "The id of the user who gets invited", "required": true, "default_value": null, "nullable": false}, "planid": {"type": "int", "description": "The id of the plan", "required": true, "default_value": null, "nullable": false}}, "returns": {"id": {"type": "int", "description": "The id of the invite"}, "inviterid": {"type": "int", "description": "The id of the owner user"}, "inviteeid": {"type": "int", "description": "The id of the invited user"}, "planid": {"type": "int", "description": "The id of the plan"}, "status": {"type": "int", "description": "The status of the invitation"}, "timestamp": {"type": "int", "description": "The time when the invitation was send"}}, "returns_multiple": false}, {"function_name": "local_lbplanner_plan_remove_user", "group": "plan", "capabilities": "student", "description": "Remove a user from the plan", "path": "lbplanner/services/plan/remove_user.php", "parameters": {"userid": {"type": "int", "description": "The id of the user", "required": true, "default_value": null, "nullable": false}, "removeuserid": {"type": "int", "description": "The id of the user to remove", "required": true, "default_value": null, "nullable": false}, "planid": {"type": "int", "description": "The id of the plan", "required": true, "default_value": null, "nullable": false}}, "returns": {}, "returns_multiple": false}, {"function_name": "local_lbplanner_plan_update_plan", "group": "plan", "capabilities": "student", "description": "Update the plan of the given user", "path": "lbplanner/services/plan/update_plan.php", "parameters": {"userid": {"type": "int", "description": "The id of the user to get the data for", "required": true, "default_value": null, "nullable": false}, "planid": {"type": "int", "description": "The id of the plan", "required": true, "default_value": null, "nullable": false}, "planname": {"type": "String", "description": "The Name of the Plan", "required": true, "default_value": null, "nullable": false}, "enableek": {"type": "bool", "description": "If the plan is enabled for ek", "required": true, "default_value": null, "nullable": false}}, "returns": {}, "returns_multiple": false}, {"function_name": "local_lbplanner_plan_leave_plan", "group": "plan", "capabilities": "student", "description": "Leave the plan of the given user", "path": "lbplanner/services/plan/leave_plan.php", "parameters": {"userid": {"type": "int", "description": "The id of the user to get the data for", "required": true, "default_value": null, "nullable": false}, "planid": {"type": "int", "description": "The id of the plan", "required": true, "default_value": null, "nullable": false}}, "returns": {}, "returns_multiple": false}, {"function_name": "local_lbplanner_plan_add_deadline", "group": "plan", "capabilities": "student", "description": "Add a deadline to the plan", "path": "lbplanner/services/plan/add_deadline.php", "parameters": {"userid": {"type": "int", "description": "The id of the user to get the data for", "required": true, "default_value": null, "nullable": false}, "planid": {"type": "int", "description": "The ID of the Plan", "required": true, "default_value": null, "nullable": false}, "moduleid": {"type": "int", "description": "The ID of the Module", "required": true, "default_value": null, "nullable": false}, "deadlinestart": {"type": "int", "description": "The Start of the Module", "required": true, "default_value": null, "nullable": false}, "deadlineend": {"type": "int", "description": "The End of the Module", "required": true, "default_value": null, "nullable": false}}, "returns": {}, "returns_multiple": false}, {"function_name": "local_lbplanner_plan_delete_deadline", "group": "plan", "capabilities": "student", "description": "Delete a deadline from the plan", "path": "lbplanner/services/plan/delete_deadline.php", "parameters": {"userid": {"type": "int", "description": "The id of the user to get the data for", "required": true, "default_value": null, "nullable": false}, "planid": {"type": "int", "description": "The ID of the Plan", "required": true, "default_value": null, "nullable": false}, "moduleid": {"type": "int", "description": "The ID of the Module", "required": true, "default_value": null, "nullable": false}}, "returns": {}, "returns_multiple": false}, {"function_name": "local_lbplanner_user_delete_user", "group": "user", "capabilities": "student", "description": "Removes all user data stored by the lbplanner app", "path": "lbplanner/services/user/delete_user.php", "parameters": {"userid": {"type": "int", "description": "The id of the user to get the data for", "required": true, "default_value": null, "nullable": false}}, "returns": {"message": {"type": "String", "description": "The message to return to the user"}}, "returns_multiple": false}, {"function_name": "local_lbplanner_plan_update_deadline", "group": "plan", "capabilities": "student", "description": "Update a deadline from the plan", "path": "lbplanner/services/plan/update_deadline.php", "parameters": {"userid": {"type": "int", "description": "The id of the user to get the data for", "required": true, "default_value": null, "nullable": false}, "planid": {"type": "int", "description": "The ID of the Plan", "required": true, "default_value": null, "nullable": false}, "moduleid": {"type": "int", "description": "The ID of the Module", "required": true, "default_value": null, "nullable": false}, "deadlinestart": {"type": "int", "description": "The start of the Module", "required": true, "default_value": null, "nullable": false}, "deadlineend": {"type": "int", "description": "The End of the Module", "required": true, "default_value": null, "nullable": false}}, "returns": {}, "returns_multiple": false}, {"function_name": "local_lbplanner_plan_get_access", "group": "plan", "capabilities": "student", "description": "Get the access type to the plan", "path": "lbplanner/services/plan/get_access.php", "parameters": {"userid": {"type": "int", "description": "The id of the user to get the data for", "required": true, "default_value": null, "nullable": false}, "planid": {"type": "int", "description": "The id of the plan", "required": true, "default_value": null, "nullable": false}}, "returns": {"accesstype": {"type": "int", "description": "The type of access the user has to the plan"}, "planid": {"type": "int", "description": "The id of the plan"}, "userid": {"type": "int", "description": "The id of the plan"}}, "returns_multiple": false}, {"function_name": "local_lbplanner_plan_update_access", "group": "plan", "capabilities": "student", "description": "Update the access of the plan", "path": "lbplanner/services/plan/update_access.php", "parameters": {"userid": {"type": "int", "description": "The id of the user to get the data for", "required": true, "default_value": null, "nullable": false}, "planid": {"type": "int", "description": "The id of the plan", "required": true, "default_value": null, "nullable": false}, "accesstype": {"type": "int", "description": "The access type", "required": true, "default_value": null, "nullable": false}, "memberid": {"type": "int", "description": "The id of the member", "required": true, "default_value": null, "nullable": false}}, "returns": {}, "returns_multiple": false}, {"function_name": "local_lbplanner_plan_get_invites", "group": "plan", "capabilities": "student", "description": "Get all the invites of the given user", "path": "lbplanner/services/plan/get_invites.php", "parameters": {"userid": {"type": "int", "description": "The id of the Owner of the plan", "required": true, "default_value": null, "nullable": false}}, "returns": {"id": {"type": "int", "description": "The id of the invite"}, "inviterid": {"type": "int", "description": "The id of the owner user"}, "inviteeid": {"type": "int", "description": "The id of the invited user"}, "planid": {"type": "int", "description": "The id of the plan"}, "status": {"type": "int", "description": "The Status of the invitation"}, "timestamp": {"type": "int", "description": "The time when the invitation was send"}}, "returns_multiple": true}, {"function_name": "local_lbplanner_notifications_get_all_notifications", "group": "notifications", "capabilities": "student", "description": "Get all the notifications of the given user", "path": "lbplanner/services/notifications/get_all_notifications.php", "parameters": {"userid": {"type": "int", "description": "User ID", "required": true, "default_value": null, "nullable": false}}, "returns": {}, "returns_multiple": true}, {"function_name": "local_lbplanner_notifications_update_notification", "group": "notifications", "capabilities": "student", "description": "Update the notification status of the given user and id", "path": "lbplanner/services/notifications/update_notification.php", "parameters": {"userid": {"type": "int", "description": "User ID", "required": true, "default_value": null, "nullable": false}}, "returns": {}, "returns_multiple": false}, {"function_name": "local_lbplanner_feedback_submit_feedback", "group": "feedback", "capabilities": "student", "description": "Add a feedback to the DB", "path": "lbplanner/services/feedback/submit_feedback.php", "parameters": {"userid": {"type": "int", "description": "The id of the user", "required": true, "default_value": null, "nullable": false}, "type": {"type": "int", "description": "The type ", "required": true, "default_value": null, "nullable": false}, "content": {"type": "String", "description": "The content of the feedback", "required": true, "default_value": null, "nullable": false}, "logfile": {"type": "String", "description": "The name of the logfile", "required": false, "default_value": null, "nullable": false}}, "returns": {}, "returns_multiple": false}, {"function_name": "local_lbplanner_feedback_get_feedback", "group": "feedback", "capabilities": "manager", "description": "Get the feedback of the given id", "path": "lbplanner/services/feedback/get_feedback.php", "parameters": {"feedbackid": {"type": "int", "description": "The id of the course", "required": true, "default_value": null, "nullable": false}, "userid": {"type": "int", "description": "The id of the user", "required": true, "default_value": null, "nullable": false}}, "returns": {}, "returns_multiple": false}, {"function_name": "local_lbplanner_feedback_get_all_feedbacks", "group": "feedback", "capabilities": "manager", "description": "Get all the feedback from the DB", "path": "lbplanner/services/feedback/get_all_feedbacks.php", "parameters": {"userid": {"type": "int", "description": "The id of the user", "required": true, "default_value": null, "nullable": false}}, "returns": {}, "returns_multiple": true}, {"function_name": "local_lbplanner_feedback_update_feedback", "group": "feedback", "capabilities": "manager", "description": "Update the feedback of the given id", "path": "lbplanner/services/feedback/update_feedback.php", "parameters": {"userid": {"type": "int", "description": "The id of the user", "required": true, "default_value": null, "nullable": false}, "feedbackid": {"type": "int", "description": "The id of the course", "required": true, "default_value": null, "nullable": false}, "notes": {"type": "String", "description": "The notes of the feedback", "required": false, "default_value": null, "nullable": true}, "status": {"type": "int", "description": "The status of the feedback", "required": true, "default_value": null, "nullable": false}}, "returns": {}, "returns_multiple": false}, {"function_name": "local_lbplanner_feedback_delete_feedback", "group": "feedback", "capabilities": "manager", "description": "Delete the feedback of the given id", "path": "lbplanner/services/feedback/delete_feedback.php", "parameters": {"userid": {"type": "int", "description": "The id of the user", "required": true, "default_value": null, "nullable": false}, "feedbackid": {"type": "int", "description": "The id of the course", "required": true, "default_value": null, "nullable": false}}, "returns": {}, "returns_multiple": true}, {"function_name": "local_lbplanner_plan_accept_invite", "group": "plan", "capabilities": "student", "description": "Accept the invite of the given id", "path": "lbplanner/services/plan/accept_invite.php", "parameters": {"inviteid": {"type": "int", "description": "The id of the plan", "required": true, "default_value": null, "nullable": false}, "userid": {"type": "int", "description": "The id of the invited user", "required": true, "default_value": null, "nullable": false}}, "returns": {"id": {"type": "int", "description": "The id of the invite"}, "inviterid": {"type": "int", "description": "The id of the owner user"}, "inviteeid": {"type": "int", "description": "The id of the invited user"}, "planid": {"type": "int", "description": "The id of the plan"}, "status": {"type": "int", "description": "The Status of the invitation"}, "timestamp": {"type": "int", "description": "The time when the invitation was send"}}, "returns_multiple": false}, {"function_name": "local_lbplanner_plan_decline_invite", "group": "plan", "capabilities": "student", "description": "Decline the invite of the given id", "path": "lbplanner/services/plan/decline_invite.php", "parameters": {"inviteid": {"type": "int", "description": "The inviteid of the plan", "required": true, "default_value": null, "nullable": false}, "userid": {"type": "int", "description": "The id of the invited user", "required": true, "default_value": null, "nullable": false}}, "returns": {"id": {"type": "int", "description": "The id of the invite"}, "inviterid": {"type": "int", "description": "The id of the owner user"}, "inviteeid": {"type": "int", "description": "The id of the invited user"}, "planid": {"type": "int", "description": "The id of the plan"}, "status": {"type": "int", "description": "The Status of the invitation"}, "timestamp": {"type": "int", "description": "The time when the invitation was send"}}, "returns_multiple": false}];


let groups = [];

for (let func of funcs) {
    let group = groups.find(g => g.groupName === func.group);
    if (!group) {
        group = {
            groupName: func.group,
            functions: []
        };
        groups.push(group);
    }
    group.functions.push(func);
}

const sidebar = document.getElementById('sidebar');
const content = document.getElementById('content');

let currentFunction = null;


function searchFunction() {

    const input = document.getElementById('search').value.toUpperCase();
    const functions = document.querySelectorAll('.func-name');

    for (let i = 0; i < functions.length; i++) {
        const textValue = functions[i].textContent || functions[i].innerText;
        if (funcName(textValue).toUpperCase().includes(input)) {
            functions[i].style.display = "";
        } else {
            functions[i].style.display = "none";
        }
    }

    // check for func-group and if it has any children that are visible and if not hide it
    const groups = document.querySelectorAll('.func-group');
    for (let group of groups) {
        let visible = false;
        for (let child of group.children) {
            if (!child.classList.contains('func-name')) continue;

            child.style.display !== 'none' ? visible = true : null;

            if (visible) break;
        }

        visible ? group.style.display = '' : group.style.display = 'none';
    }
}

const groupsElement = document.querySelector('#func-groups');
const detailsPane = document.querySelector('#func-details');

function displayGroupsAndFunctions() {
    groups.forEach(group => {
        const groupElement = document.createElement('div');
        groupElement.classList.add('func-group');

        groupName = document.createElement('h1');
        groupName.textContent = group.groupName;

        groupElement.appendChild(groupName);
        groupsElement.appendChild(groupElement);

        group.functions.forEach(func => {
            const funcElement = document.createElement('p');
            funcElement.classList.add('func-name');
            funcElement.textContent = func.function_name;
            funcElement.onclick = () => {
                if (currentFunction) {
                    currentFunction.removeAttribute('active');
                }

                funcElement.setAttribute('active', '');

                currentFunction = funcElement;

                displayFunctionDetails(func);
            };
            groupElement.appendChild(funcElement);
        });
    });
    let bottomSpacer = document.createElement('div');
    bottomSpacer.style.height = '100px';
    groupsElement.appendChild(bottomSpacer);
}

function funcName(fullName) {
    // remove everything from the third underscore
    const split = fullName.split('_');
    return split.slice(3, split.length).join(' ');
}

function displayFunctionDetails(func) {

    detailsPane.innerHTML = `
    <h1>${funcName(func.function_name)}</h1>
    <p id="full-func-name">${func.function_name} <i class="fa-regular fa-copy" id="copy"></i></p>
    <hr />
    <p id="func_desc">${func.description}</p>
    <h2>Parmeters</h2>
    <hr />
    ${Object.keys(func.parameters).map(param => `
    <div class="param">
        <div class="param-signature">
            <p class="param-name">${param}</p>
            <p>${func.parameters[param].type}</p>
            <p class="param-${func.parameters[param].required ? 'required' : 'optional'}">${func.parameters[param].required ? 'required' : 'optional'}</p>
        </div>
        <p class="param-desc">${func.parameters[param].description}</p>
    </div>
`).join('')}
    <h2>Returns${func.returns_multiple ? '<p class="badge" style="  font-size: 0.7rem;">Array</p>' : ""}</h2>
    <hr />
    ${Object.keys(func.returns).map(ret => `
    <div class="value">
    <div class="value-signature">
      <p class="value-name">${ret}</p>
      <p>${func.returns[ret].type}</p>
    </div>
    <p class="value-desc">${func.returns[ret].description}</p>
  </div>
`).join('')}
    `;

    let copy = document.getElementById('copy');
    copy.onclick = () => {
        navigator.clipboard.writeText(func.function_name);
    }

    let returnValues = document.querySelectorAll('.value-name');
    let params = document.querySelectorAll('.param-name');

    for (let value of returnValues){
        value.addEventListener('click', () => {
            navigator.clipboard.writeText(value.innerText)
        });
    }

    for (let param of params){
        param.addEventListener('click', () => {
            navigator.clipboard.writeText(param.innerText)
        });
    }
}

displayGroupsAndFunctions();

document.getElementById('search').addEventListener('keyup', searchFunction);
