package site.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import site.facade.AdminFacade;
import site.facade.RegistrantFacade;
import site.model.Registrant;
import site.model.Visitor;
import site.model.VisitorStatus;

import javax.validation.Valid;

/**
 * @author Mitia
 */
@Controller()
@RequestMapping(value = "/admin/visitor")
public class VisitorController {

    public static final String VISITORS_JSP = "/admin/visitor/view.jsp";
    public static final String VISITOR_EDIT_JSP = "/admin/visitor/edit.jsp";

    @Autowired
    @Qualifier(AdminFacade.NAME)
    private AdminFacade adminFacade;

    @Autowired
    @Qualifier(RegistrantFacade.NAME)
    private RegistrantFacade registrantFacade;

    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public String viewVisitors(Model model) {
        model.addAttribute("visitors", adminFacade.findAllNewestVisitors());
        return VISITORS_JSP;
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(@Valid final Visitor visitor, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return VISITOR_EDIT_JSP;
        }
        //may be its better to use a set of registrants for sponsors?

        if (visitor.getRegistrant() == null) {
            Registrant registrant = new Registrant();
            registrant.setName(visitor.getName());
            registrant.setEmail(visitor.getEmail());
            visitor.setRegistrant(registrant);
            registrant.getVisitors().add(visitor);
            this.adminFacade.saveRegistrant(registrant);
        } else {
            this.adminFacade.saveRegistrant(visitor.getRegistrant());
        }
        return "redirect:/admin/visitor/view";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String getNewVisitorForm(Model model) {
        model.addAttribute("visitor", new Visitor());
        model.addAttribute("statuses", VisitorStatus.values());
        return VISITOR_EDIT_JSP;
    }

    @RequestMapping(value = "/edit/{itemId}", method = RequestMethod.GET)
    public String getEditVisitorForm(@PathVariable("itemId") Long itemId, Model model) {
        Visitor visitor = adminFacade.findOneVisitor(itemId);
        model.addAttribute("statuses", VisitorStatus.values());
        model.addAttribute("visitor", visitor);
        return VISITOR_EDIT_JSP;
    }

    @RequestMapping(value = "/remove/{itemId}", method = RequestMethod.GET)
    public String remove(@PathVariable("itemId") Long itemId, Model model) {
        adminFacade.deleteVisitor(itemId);
        return "redirect:/admin/visitor/view";
    }
}