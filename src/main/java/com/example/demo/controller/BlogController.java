package com.example.demo.controller;

import com.example.demo.entity.Blog;
import com.example.demo.entity.User;
import com.example.demo.repository.BlogRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class BlogController {

    @Autowired
    private BlogRepository blogRepository;

    // Dashboard
    @GetMapping("/dashboard")
    public String dashboard(HttpSession session) {
        if (session.getAttribute("user") == null) {
            return "redirect:/login";
        }
        return "dashboard";
    }

    // Show create blog form
    @GetMapping("/create")
    public String createBlogForm(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        model.addAttribute("username", user.getUsername());
        return "create_blog";
    }

    // Handle blog creation
    @PostMapping("/create")
    public String createBlog(@RequestParam String title,
                             @RequestParam String content,
                             @RequestParam String author,
                             HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";

        Blog blog = new Blog(title, content, author);
        blogRepository.save(blog);
        return "redirect:/dashboard";
    }

    // View all public blogs
    @GetMapping("/public")
    public String viewPublic(Model model, HttpSession session) {
        if (session.getAttribute("user") == null) return "redirect:/login";

        List<Blog> blogs = blogRepository.findAll();
        model.addAttribute("blogs", blogs);
        return "view_public";
    }

    // View only logged-in user's blogs
    @GetMapping("/personal")
    public String viewPersonal(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";

        List<Blog> personalBlogs = blogRepository.findByAuthor(user.getUsername());
        model.addAttribute("blogs", personalBlogs);
        return "view_personal";
    }

    // Show edit form
    @GetMapping("/edit/{id}")
    public String editBlog(@PathVariable Long id, HttpSession session, Model model) {
        if (session.getAttribute("user") == null) return "redirect:/login";

        Blog blog = blogRepository.findById(id).orElse(null);
        if (blog == null) {
            return "redirect:/personal";
        }

        model.addAttribute("blog", blog);
        return "edit_blog";
    }

    // Apply blog changes
    @PostMapping("/edit/{id}")
    public String applyChanges(@PathVariable Long id,
                               @RequestParam String title,
                               @RequestParam String content,
                               HttpSession session) {
        if (session.getAttribute("user") == null) return "redirect:/login";

        Blog blog = blogRepository.findById(id).orElse(null);
        if (blog != null) {
            blog.setTitle(title);
            blog.setContent(content);
            blogRepository.save(blog);
        }

        return "redirect:/personal";
    }

    // Delete blog
    @GetMapping("/delete/{id}")
    public String deleteBlog(@PathVariable Long id, HttpSession session) {
        if (session.getAttribute("user") == null) return "redirect:/login";

        blogRepository.deleteById(id);
        return "redirect:/personal";
    }

    // ==== ✅ SEARCH PART STARTS HERE ====

    @GetMapping("/search")
    public String showSearchPage() {
        return "search";
    }

    @PostMapping("/search")
    public String handleSearch(@RequestParam(required = false) String topic,
                               @RequestParam(required = false) String author,
                               Model model) {

        List<Blog> results;

        if (author != null && !author.isEmpty() && topic != null && !topic.isEmpty()) {
            results = blogRepository.findByAuthorAndTitleContainingIgnoreCase(author, topic);
        } else if (author != null && !author.isEmpty()) {
            results = blogRepository.findByAuthor(author);
        } else if (topic != null && !topic.isEmpty()) {
            results = blogRepository.findByTitleContainingIgnoreCase(topic);
        } else {
            results = List.of(); // empty
        }

        model.addAttribute("results", results);
        return "search";
    }
}
